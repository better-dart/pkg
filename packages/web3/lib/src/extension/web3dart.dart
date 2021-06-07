import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:web3dart/web3dart.dart';

import '../../web3.dart';

extension Web3DartExt on Web3Client {
  /// bugFix: 去除参数默认值
  Future<String> sendTransactionEx(Credentials cred, Transaction transaction) async {
    final chainId = await getNetworkId();
    final signed = await signTransaction(cred, transaction, chainId: chainId);
    return sendRawTransaction(signed);
  }

  Future<String> transfer(String receiverAddress, int amountInWei, String privateKey) async {
    print('transfer --> receiver: $receiverAddress, amountInWei: $amountInWei');

    /// todo: check approved

    EthereumAddress receiver = EthereumAddress.fromHex(receiverAddress);
    EtherAmount amount = EtherAmount.fromUnitAndValue(EtherUnit.wei, BigInt.from(amountInWei));

    ///
    String txHash = await _sendTransactionAndWaitForReceipt(
      Transaction(to: receiver, value: amount),
      privateKey,
    );
    print('transfer done, txID: $txHash successful');
    return txHash;
  }

  ///
  Future<String> tokenTransfer(
    String tokenAddress,
    String receiverAddress,
    num tokensAmount,
    String privateKey,
  ) async {
    EthereumAddress receiver = EthereumAddress.fromHex(receiverAddress);

    ///
    dynamic tokenDetails = await getTokenDetails(tokenAddress);
    int tokenDecimals = int.parse(tokenDetails["decimals"].toString());
    Decimal tokensAmountDecimal = Decimal.parse(tokensAmount.toString());
    Decimal decimals = Decimal.parse(pow(10, tokenDecimals).toString());
    BigInt amount = BigInt.parse((tokensAmountDecimal * decimals).toString());

    ///
    return await _callContract(
      'BasicToken',
      tokenAddress,
      'transfer',
      [receiver, amount],
      privateKey,
    );
  }

  Future<dynamic> getTokenDetails(String tokenAddress) async {
    return {
      "name": (await _readFromContract('BasicToken', tokenAddress, 'name', [])).first,
      "symbol": (await _readFromContract('BasicToken', tokenAddress, 'symbol', [])).first,
      "decimals": (await _readFromContract('BasicToken', tokenAddress, 'decimals', [])).first
    };
  }

  ///
  Future<Credentials> setCredentials(String privateKey) async {
    return credentialsFromPrivateKey(privateKey);
  }

  /// for token:
  Future<dynamic> getTokenBalance(String contractAddress, {required String address}) async {
    List<dynamic> params = [EthereumAddress.fromHex(address)];

    ///
    var ret = (await _readFromContract('BasicToken', contractAddress, 'balanceOf', params)).first;
    print('getTokenBalance: $contractAddress, $address, result: $ret');
    return ret;
  }

  ///
  Future<List<dynamic>> _readFromContract(String contractName, String contractAddress, String functionName, List<dynamic> params) async {
    ///
    /// 合约:
    ///
    DeployedContract contract = await _contract(contractName, contractAddress);

    try {
      var ret = await call(contract: contract, function: contract.function(functionName), params: params);
      print('debugX: _readFromContract done: name:$contractName, address: $contractAddress, fn:$functionName, args:$params, result:$ret');
      return ret;
    } catch (error, trace) {
      logger.e('debugX: _readFromContract error : name:$contractName, address: $contractAddress, fn:$functionName, args:$params, error:$error, trace:$trace');
    }
    return [];
  }

  ///
  /// 合约 abi:
  ///
  Future<DeployedContract> _contract(String contractName, String contractAddress) async {
    ///
    /// 合约 abi get:
    ///
    String abi = ABI.get(contractName);
    print('abi name: $contractName,address: $contractAddress, abi: $abi');

    ///
    /// deploy contract abi:
    ///
    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    print('debugX: web3 - _contract: $contractName, $contractAddress');
    return contract;
  }

  Future<String> _callContract(String contractName, String contractAddress, String functionName, List<dynamic> params, String privateKey) async {
    // todo: approved check

    DeployedContract contract = await _contract(contractName, contractAddress);
    Transaction tx = Transaction.callContract(contract: contract, function: contract.function(functionName), parameters: params);
    return await _sendTransactionAndWaitForReceipt(tx, privateKey);
  }

  Future<String> _sendTransactionAndWaitForReceipt(Transaction transaction, String privateKey) async {
    print('sendTransactionAndWaitForReceipt');

    ///
    var _credentials = await setCredentials(privateKey);
    var _networkId = await getNetworkId();

    /// send:
    String txHash = await sendTransaction(_credentials, transaction);

    /// async watch tx done: not add await
    watchTxStatus(txHash);

    return txHash;
  }

  // wait and report:
  Future<TransactionReceipt> watchTxStatus(String txHash) async {
    TransactionReceipt? receipt;
    try {
      print('async watch tx status');
      receipt = await getTransactionReceipt(txHash);
    } catch (err) {
      print('could not get $txHash receipt, try again');
    }

    /// with retry:
    int delay = 1;
    int retries = 10;
    while (receipt == null) {
      print('retry: waiting for receipt');
      await Future.delayed(new Duration(seconds: delay));
      delay *= 2;
      retries--;
      if (retries == 0) {
        throw 'transaction $txHash not mined yet...';
      }
      try {
        receipt = await getTransactionReceipt(txHash);
      } catch (err) {
        print('could not get $txHash receipt, try again');
      }
    }
    return receipt;
  }
}
