import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:http/http.dart';
// import 'package:wallet_core/wallet_core.dart' as fuse_wallet;
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../../extension/index.dart';
import '../../index.dart';

// 1 eth = 1000000000000000000 wei ( 18个0)
BigInt ethUnit = BigInt.from(10).pow(18);

///
/// 不同链:
///
class EthWalletGroup {
  /// 正式链:
  final _main = EthWallet(
    url: NetworkProxy['ETH']!['mainnet']!.httpUrl!,
    networkId: NetworkProxy['ETH']!['mainnet']!.networkID,
  );

  /// 测试链:
  final _testKovan = EthWallet(
    url: NetworkProxy['ETH']!['kovan']!.httpUrl!,
    networkId: NetworkProxy['ETH']!['kovan']!.networkID,
  );

  ///
  /// auto select:
  EthWallet client({bool isTestNet = true}) {
    return isTestNet ? _testKovan : _main;
  }

  NetWorkOption? network({bool isTestNet = false}) {
    return isTestNet ? NetworkProxy['ETH']!['kovan'] : NetworkProxy['ETH']!['mainnet'];
  }
}

/// eth 钱包:
class EthWallet {
  /// fuse wallet:
  // fuse_wallet.Web3 sdkFuse;

  /// web3 dart:
  late Web3Client sdkWeb3;

  ///////////////////////////////////////////////////////////////////////////

  EthWallet({
    required String url,
    int? networkId,
  }) {
    /// web3 client:
    sdkWeb3 = Web3Client(url, Client());

    /// fuse wallet:
    // sdkFuse = fuse_wallet.Web3(() async => true, url: url, networkId: networkId);
  }

  /// 生成 HD 钱包:
  Future<HDWallet> genHDWallet() async {
    var mnemonic = genMnemonic();
    var privateKey = privateKeyFromMnemonic(mnemonic);

    /// 注意: 地址转成小写!
    var publicAddress = (await genPublicAddress(privateKey)).hex.toLowerCase();

    return HDWallet(
      mnemonic: genMnemonic(),
      privateKey: privateKey,
      publicAddress: publicAddress,
    );
  }

  /// 助记词:
  String genMnemonic() => bip39.generateMnemonic();

  /// 私钥:
  String privateKeyFromMnemonic(String mnemonic) {
    var seed = bip39.mnemonicToSeed(mnemonic);
    var root = bip32.BIP32.fromSeed(seed);
    var child = root.derivePath("m/44'/60'/0'/0/0");
    return bytesToHex(child.privateKey!);
  }

  /// 获取钱包地址:
  Future<EthereumAddress> genPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  /// 单位转换: wei -> ether
  ///   - bigInt 有坑: 只有 x/y = double 值是正确的
  ///
  double toEther({
    required BigInt fromWei,
    int decimals = 18, // 转换精度位数: 默认 eth=18
  }) {
    /// 换算单位: 10^x 幂
    var unit = BigInt.from(10).pow(decimals);

    /// 转换:
    return fromWei / unit;
  }

  /// 单位转换:
  BigInt toWei({
    required double fromEther, // 浮点值
    int decimals = 18, // eth 默认
  }) {
    /// 换算单位: 10^x 幂
    var unit = BigInt.from(10).pow(decimals);

    /// 换算:
    /// fix: from(double), 会取整舍入, 导致丢失精度, 要先做乘法
    ///   - https://www.woolha.com/tutorials/dart-using-bigint-examples
    var ret = BigInt.from(fromEther * unit.toInt());
    print('convert to wei: fromEther: $fromEther, unit:$unit, wei:$ret');
    return ret;
  }

  /// 查询余额: 兼容 主链+token
  Future<double> getBalance({
    required String address, // 当前用户地址
    String? contractAddress, // 合约地址
    int? decimals = 18, // 转换精度位数: 默认 eth=18
  }) async {
    var balance = 0.0;

    if (contractAddress != null) {
      /// token 查询:
      BigInt? ret = (await sdkWeb3.getTokenBalance(contractAddress, address: address)) as BigInt;

      /// 单位换算:
      balance = toEther(fromWei: ret, decimals: decimals!);
    } else {
      /// 主链查询:
      var ret = await sdkWeb3.getBalance(EthereumAddress.fromHex(address));

      /// 单位换算:
      balance = toEther(fromWei: ret.getInWei, decimals: decimals!);
    }
    print('getBalance: address=$address, contractAddress=$contractAddress, balance=$balance, decimals=$decimals');
    return balance;
  }

  /// 转账: 合并 ETH + ETH Tokens
  /// TODO: 本地存储+更新 nonce
  Future<String> transfer({
    required String privateKey,
    required String toAddress,
    required num amount,
    String? contractAddress,
  }) async {
    var txID = '';

    /// do tx:
    try {
      /// 合约 Token:
      if (contractAddress != null) {
        txID = await sdkWeb3.tokenTransfer(contractAddress, toAddress, amount, privateKey);
        logger.i('do wallet token transfer done: $contractAddress, $toAddress, amount:$amount, $txID');
      } else {
        var amountInWei = toWei(fromEther: amount as double).toInt();

        if (amountInWei <= 0) {
          logger.e('invalid amount, skip transfer,  input amount:$amount, wei:$amountInWei ');
          return '';
        }

        /// 主链 ETH:
        txID = await sdkWeb3.transfer(toAddress, amountInWei, privateKey);
        logger.i('do wallet transfer done: to:$toAddress, amount:$amount, wei:$amountInWei, $txID');
      }
    } catch (e, s) {
      logger.e('do wallet transfer exception: $e, $s');
    }
    return txID;
  }

  /// 签名身份:
  Future<Credentials> getCredentials(String privateKey) async {
    return sdkWeb3.credentialsFromPrivateKey(privateKey);
  }

  /// 调用合约:
  Future<String> ethCall({
    fromAddress, // 允许空
    required String toAddress, // 合约地址
    required String data, // 数据
    BlockNum? atBlock, // 允许空
  }) async {
    return sdkWeb3.callRaw(
      sender: (fromAddress != null ? EthereumAddress.fromHex(fromAddress) : null),
      contract: EthereumAddress.fromHex(toAddress),
      data: hexToBytes(data),
      atBlock: atBlock,
    );
  }

  ///
  /// 此版本有效:
  ///
  Future<String> swapToken({
    required String privateKey,
    required String fromAddress,
    required String toAddress,
    required String data,
    BigInt? value, // chainType=ETH, eth2token, set value //  token2eth, set 0
    int? maxGas,
  }) async {
    var cred = await getCredentials(privateKey);

    return sdkWeb3.sendTransactionEx(
      cred,
      Transaction(
        from: EthereumAddress.fromHex(fromAddress),
        to: EthereumAddress.fromHex(toAddress),
        data: hexToBytes(data),
        value: EtherAmount.inWei(value ?? 0 as BigInt),
        maxGas: maxGas ?? 10000000, // todo: need fix
      ),
    );
  }

  /// swap token <-> eth:
  ///   - 此版本无效
  ///   - 参考 callContractOffChain() 方法
  ///
// Future<String> swapTokenOld({
//   @required String privateKey,
//   @required String fromAddress,
//   @required String toAddress,
//   @required String data,
//   BigInt value, // chainType=ETH, eth2token, set value //  token2eth, set 0
// }) async {
//   /// 签名结果:
//   String signature = await signToken(
//     privateKey: privateKey,
//     contractAddress: fromAddress,
//     walletAddress: toAddress,
//     data: data,
//     value: value,
//   );
//
//   // var signed = hexToBytes(signature);
//
//   /// 广播交易+返回 txID
//   var txID = await sdkWeb3.sendRawTx(signedStr: signature);
//   return txID;
// }

  /// token swap: 签名
// Future<String> signToken({
//   @required String privateKey,
//   @required String contractAddress,
//   @required String walletAddress,
//   @required String data,
//   BigInt value, // chainType=ETH, eth2token, set value //  token2eth, set 0
//   String nonce,
// }) async {
//   var count = await sdkWeb3.getTransactionCount(EthereumAddress.fromHex(walletAddress)) + 1;
//
//   /// 签名:
//   String signature = await signOffChain(
//     privateKey: privateKey,
//     fromAddress: contractAddress,
//     toAddress: walletAddress,
//     // 为0
//     value: value ?? BigInt.from(0),
//     // 合约数据
//     data: data,
//     nonce: nonce ?? BigInt.from(count),
//     gasPrice: BigInt.from(0),
//     gasLimit: BigInt.from(9000000),
//   );
//   return signature;
// }

  /// 签名参数:
// Future<String> signOffChain({
//   // 钱包私钥:
//   @required String privateKey,
//   // 合约地址:
//   @required String fromAddress,
//   // 钱包地址:
//   @required String toAddress,
//   // 注意!
//   BigInt value,
//   // 注意!
//   String data,
//   BigInt nonce,
//   BigInt gasPrice,
//   BigInt gasLimit,
// }) async {
//   /// set cred for sign:
//   await sdkFuse.setCredentials(privateKey);
//
//   /// TODO : 地址 from, to 可能有问题
//   return sdkFuse.signOffChain2(fromAddress, toAddress, value, data, nonce, gasPrice, gasLimit);
// }
}
