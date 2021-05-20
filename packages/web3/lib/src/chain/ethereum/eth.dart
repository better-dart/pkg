import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart' as fuse_wallet;
import 'package:web3/src/proto/Binance.pb.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import '../../index.dart';

// 1 eth = 1000000000000000000 wei ( 18个0)
BigInt ethUnit = BigInt.from(10).pow(18);

///
/// 不同链:
///
class EthWalletGroup {
  /// 正式链:
  final _main = EthWallet(
    url: NetworkProxy['ETH']['mainnet'].httpUrl,
    networkId: NetworkProxy['ETH']['mainnet'].networkID,
  );

  /// 测试链:
  final _testKovan = EthWallet(
    url: NetworkProxy['ETH']['kovan'].httpUrl,
    networkId: NetworkProxy['ETH']['kovan'].networkID,
  );

  ///
  /// auto select:
  EthWallet client({bool isTestNet = true}) {
    return isTestNet ? _testKovan : _main;
  }

  NetWorkOption network({bool isTestNet = false}) {
    return isTestNet ? NetworkProxy['ETH']['kovan'] : NetworkProxy['ETH']['mainnet'];
  }
}

/// eth 钱包:
class EthWallet {
  /// fuse wallet:
  fuse_wallet.Web3 sdkFuse;

  /// web3 dart:
  Web3Client sdkWeb3;

  ///////////////////////////////////////////////////////////////////////////

  EthWallet({
    @required String url,
    @required int networkId,
  }) {
    /// web3 client:
    sdkWeb3 = Web3Client(url, Client());

    /// fuse wallet:
    sdkFuse = fuse_wallet.Web3(() async => true, url: url, networkId: networkId);
  }

  /// 助记词:
  String genMnemonic() => bip39.generateMnemonic();

  /// 私钥:
  String privateKeyFromMnemonic(String mnemonic) {
    var seed = bip39.mnemonicToSeed(mnemonic);
    var root = bip32.BIP32.fromSeed(seed);
    var child = root.derivePath("m/44'/60'/0'/0/0");
    return bytesToHex(child.privateKey);
  }

  /// 获取钱包地址:
  Future<EthereumAddress> genPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  /// 获取钱包地址:
  Future<String> getAddress({String privateKey}) async {
    if (privateKey.isNotEmpty) {
      await sdkFuse.setCredentials(privateKey);
    }

    return sdkFuse.getAddress();
  }

  /// 单位转换: wei -> ether
  ///   - bigInt 有坑: 只有 x/y = double 值是正确的
  ///
  double toEther({
    @required BigInt fromWei,
    int decimals = 18, // 转换精度位数: 默认 eth=18
  }) {
    /// 换算单位: 10^x 幂
    var unit = BigInt.from(10).pow(decimals);

    /// 转换:
    return fromWei / unit;
  }

  /// 单位转换:
  BigInt toWei({
    double fromEther, // 浮点值
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
    @required String address, // 当前用户地址
    String contractAddress, // 合约地址
    int decimals = 18, // 转换精度位数: 默认 eth=18
  }) async {
    var balance = 0.0;

    if (contractAddress != null) {
      /// token 查询:
      BigInt ret = await sdkFuse.getTokenBalance(contractAddress, address: address);

      /// 单位换算:
      balance = toEther(fromWei: ret, decimals: decimals);
    } else {
      /// 主链查询:
      var ret = await sdkFuse.getBalance(address: address);

      /// 单位换算:
      balance = toEther(fromWei: ret.getInWei, decimals: decimals);
    }
    print('getBalance: address=$address, contractAddress=$contractAddress, balance=$balance, decimals=$decimals');
    return balance;
  }

  /// 转账:
  Future<Map<String, dynamic>> transferOffChain(
    String fromAddress,
    String toAddress,
    int amountInWei,
  ) async {
    return sdkFuse.transferOffChain(fromAddress, toAddress, amountInWei);
  }

  /// 广播交易:
  Future<String> sendRawTx({
    @required String privateKey,
    @required String fromAddress,
    @required String toAddress,
    @required String data,
    @required BigInt amountInWei, // amount
    int maxGas,
    String gasPrice,
    String nonce,
  }) async {
    /// set privateKey:
    await sdkFuse.setCredentials(privateKey);

    var from = EthereumAddress.fromHex(toAddress);
    var to = EthereumAddress.fromHex(toAddress);

    /// todo: fix unit
    var amount = EtherAmount.fromUnitAndValue(EtherUnit.wei, amountInWei);

    /// nonce: fix
    var nonce = await sdkFuse.getTxNonce(address: fromAddress);

    /// convert:
    var rawData = hexToBytes(data);
    logger.d('web3 sendTx:  rawData:$rawData');
    logger.d('web3 sendTx: privateKey: $privateKey, amount: $amountInWei, txData:$data');

    var rawTx = Transaction(
      from: from,
      to: to,
      value: amount,
      data: rawData,
      nonce: nonce, // required
    );

    /// send tx:
    var txID = await sdkFuse.sendTx(rawTx);
    logger.d('web3 sdk sendTx: txID: $txID, tx:$rawTx');
    return txID;
  }

  /// 转账: 合并 ETH + ETH Tokens
  /// TODO: 本地存储+更新 nonce
  Future<String> transfer({
    @required String privateKey,
    @required String toAddress,
    @required num amount,
    String contractAddress,
  }) async {
    var txID = '';

    /// set privateKey:
    await sdkFuse.setCredentials(privateKey);

    /// do tx:
    try {
      /// 合约 Token:
      if (contractAddress != null) {
        txID = await sdkFuse.tokenTransfer(contractAddress, toAddress, amount);
        logger.i('do wallet token transfer done: $contractAddress, $toAddress, amount:$amount, $txID');
      } else {
        var amountInWei = toWei(fromEther: amount).toInt();

        if (amountInWei <= 0) {
          logger.e('invalid amount, skip transfer,  input amount:$amount, wei:$amountInWei ');
          return '';
        }

        /// 主链 ETH:
        txID = await sdkFuse.transfer(toAddress, amountInWei);
        logger.i('do wallet transfer done: to:$toAddress, amount:$amount, wei:$amountInWei, $txID');
      }
    } catch (e, s) {
      logger.e('do wallet transfer exception: $e, $s');
    }
    return txID;
  }

  void approve({
    String chainType,
  }) {}

  /// 签名身份:
  Future<Credentials> getCredentials(String privateKey) async {
    return sdkWeb3.credentialsFromPrivateKey(privateKey);
  }

  ///
  /// token swap:
  ///   - 参考 callContractOffChain() 方法
  ///
  Future<String> swapETHToToken({
    @required String privateKey,
    @required String fromAddress,
    @required String toAddress,
    @required String data,
  }) async {
    /// 签名结果:
    String signature = await signToken(
      privateKey: privateKey,
      contractAddress: fromAddress,
      walletAddress: toAddress,
      data: data,
    );

    /// 广播交易+返回 txID
    var txID = await sdkWeb3.sendRawTx(signedStr: signature);
    return txID;
  }

  /// token swap: 签名
  Future<String> signToken({
    @required String privateKey,
    @required String contractAddress,
    @required String walletAddress,
    @required String data,
    String nonce,
  }) async {
    /// 签名:
    String signature = await signOffChain(
      privateKey: privateKey,
      fromAddress: contractAddress,
      toAddress: walletAddress,
      // 为0
      value: BigInt.from(0),
      // 合约数据
      data: data,
      nonce: nonce,
      gasPrice: BigInt.from(0),
      gasLimit: BigInt.from(700000),
    );
    return signature;
  }

  /// 签名参数:
  Future<String> signOffChain({
    // 钱包私钥:
    @required String privateKey,
    // 合约地址:
    @required String fromAddress,
    // 钱包地址:
    @required String toAddress,
    // 注意!
    BigInt value,
    // 注意!
    String data,
    String nonce,
    BigInt gasPrice,
    BigInt gasLimit,
  }) async {
    /// set cred for sign:
    sdkFuse.setCredentials(privateKey);

    /// TODO : 地址 from, to 可能有问题
    return sdkFuse.signOffChain(fromAddress, toAddress, value, data, nonce, gasPrice, gasLimit);
  }
}
