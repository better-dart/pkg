import '../index.dart';

/*
* api:
*   - https://ropsten.etherscan.io/apis
*
* docs:
*   - https://ethereum.org/en/developers/docs/networks/
*   - https://docs.ethhub.io/using-ethereum/test-networks/
*   - https://ropsten.etherscan.io/
*   - https://faucet.metamask.io/
*
* network id:
*   - https://chainid.network/
*     - eth:
*        1: Ethereum Mainnet
*        2: Morden Testnet (deprecated)
*        3: Ropsten Testnet
*        4: Rinkeby Testnet
*        42: Kovan Testnet
*
* */

/// 以太坊:
var EthNetwork = NetworkProxy['ETH'];
var EthMainnet = EthNetwork['mainnet'];
var EthKovan = EthNetwork['kovan'];

///
/// 2a8832f9bad44152a976a3be1f32c328
/// fecf99e5d4c54dc489aa57a7cdd29114
///
var infuraKey = 'put_your_infura_key_here';

void setInFuraKey({String secretKey}) {
  infuraKey = secretKey ?? '2a8832f9bad44152a976a3be1f32c328';
}

/// eth 节点网络参数:
/// 注册: https://infura.io/
///   - 账号用于访问公共的 eth 节点服务.
///
var NetworkProxy = <String, Map<String, NetWorkOption>>{
  'ETH': {
    /// 本地:
    'local': NetWorkOption(
      httpUrl: 'http://localhost:7545',
      name: 'local',
    ),

    /// 主网:
    'mainnet': NetWorkOption(
      httpUrl: 'https://mainnet.infura.io/v3/${infuraKey}',
      wsUrl: 'wss://mainnet.infura.io/ws/v3/${infuraKey}',
      networkID: 1,
      name: 'mainnet',
    ),
    // 测试链: 需要注册一个 project_id
    ///
    'ropsten': NetWorkOption(
      httpUrl: 'https://ropsten.infura.io/v3/${infuraKey}',
      //'https://ropsten.infura.io/v3',
      wsUrl: 'wss://ropsten.infura.io/ws/v3/${infuraKey}',
      // websocket
      networkID: 3,
      name: 'ropsten',
    ),

    ///
    'kovan': NetWorkOption(
      httpUrl: 'https://kovan.infura.io/v3/${infuraKey}',
      wsUrl: 'wss://kovan.infura.io/ws/v3/${infuraKey}',
      networkID: 42,
    ),

    ///
    'rinkeby': NetWorkOption(
      httpUrl: 'https://rinkeby.infura.io/v3/${infuraKey}',
      wsUrl: 'wss://rinkeby.infura.io/ws/v3/${infuraKey}',
      networkID: 4,
    ),

    ///
    'goerli': NetWorkOption(
      httpUrl: 'https://goerli.infura.io/v3/${infuraKey}',
      wsUrl: 'wss://goerli.infura.io/ws/v3/${infuraKey}',
    ),
  },
};
