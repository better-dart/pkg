import 'package:web3/src/index.dart';

///
/// 生成 HD 钱包:
///
class HDWallet {
  /// 钱包助记词:
  String mnemonic;

  /// 钱包私钥:
  String privateKey;

  /// 钱包地址:
  String publicAddress;

  HDWallet({required this.mnemonic, required this.privateKey, required this.publicAddress});

  @override
  String toString() {
    return 'HDWallet{mnemonic: $mnemonic, privateKey: $privateKey, publicAddress: $publicAddress}';
  }
}
