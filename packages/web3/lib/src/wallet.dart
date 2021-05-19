import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:wallet_core/wallet_core.dart' as fuse_wallet;
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

///
class WalletCore {
  fuse_wallet.Web3 cli;

  ////////////////////////////////////////////////////////

  // eth: create
  fuse_wallet.Web3 web3Cli(
    Future<bool> Function() approveCb, {
    String url,
    int networkId,
    String defaultCommunityAddress,
    String communityManagerAddress,
    String transferManagerAddress,
    String daiPointsManagerAddress,
    int defaultGasLimit,
  }) {
    cli = fuse_wallet.Web3(
      approveCb,
      url: url,
      networkId: networkId,
      defaultCommunityAddress: defaultCommunityAddress,
      communityManagerAddress: communityManagerAddress,
      transferManagerAddress: transferManagerAddress,
      defaultGasLimit: defaultGasLimit,
    );

    return cli;
  }

  // 助记词:
  String genMnemonic() {
    return bip39.generateMnemonic();
  }

  // 私钥:
  String privateKeyFromMnemonic(String mnemonic) {
    var seed = bip39.mnemonicToSeed(mnemonic);
    var root = bip32.BIP32.fromSeed(seed);
    var child = root.derivePath("m/44'/60'/0'/0/0");
    return bytesToHex(child.privateKey);
  }

  // 地址:
  Future<EthereumAddress> genPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  void genPublicKey() {}

  void transfer(String fromAddress, String toAddress) {}
}

// todo:
class KeyData {
  List<int> key;
  List<int> chainCode;

  KeyData({this.key, this.chainCode});
}
