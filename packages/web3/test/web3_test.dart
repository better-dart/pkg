import 'package:flutter_test/flutter_test.dart';

import '../lib/web3.dart';

void main() {
  const rpcUrl = 'https://kovan.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161';
  var client = EthWallet(url: rpcUrl);

  test('adds one to input values', () {
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });

  test('dotEnv test', () {});

  test('web3 test -  gen hd wallet', () async {
    var hd = await client.genHDWallet();
    print('hd wallet: $hd');
  });

  test('web3 test -  get balance', () async {
    var address = '0x9fe1901f3bb6cd21dca275f5e746409bd4ae8861';
    var result = await client.getBalance(address: address);
    print('get balance : $result');
  });

  test('web3 test -  diff privateKey', () async {
    /// HDWallet{
    /// mnemonic: around fall gather unusual load wish cream dust reason face squirrel toe,
    /// privateKey: 6e02997235fbadea7161e38cd8a8c2a0cca7c50e6d218b38763935f2472f7486,
    /// publicAddress: 0xe88b8b1f3f6f457f68b6b0eea8970da4e076006c}
    ///
    var mnemonic = 'around fall gather unusual load wish cream dust reason face squirrel toe';
    var privateKey = '6e02997235fbadea7161e38cd8a8c2a0cca7c50e6d218b38763935f2472f7486';
    var publicAddress = '0xe88b8b1f3f6f457f68b6b0eea8970da4e076006c';

    /// gen:
    var retPrivateKey = client.privateKeyFromMnemonic(mnemonic);
    var retAddress1 = await client.genPublicAddress(privateKey);
    var retAddress2 = await client.genPublicAddress(retPrivateKey);

    assert(retPrivateKey == privateKey);
    assert(publicAddress == retAddress1.toString());
    assert(publicAddress == retAddress2.toString());

    print('gen privateKey $retPrivateKey');
    print('gen address: $retAddress1, $retAddress2');
  });
}
