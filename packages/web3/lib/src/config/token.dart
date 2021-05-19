import '../index.dart';

///
const assetsRoot = 'assets/icon/coin';

///
///
///
const iconETH = '${assetsRoot}/eth.png';
const iconUSDT = '${assetsRoot}/usdt.png';
const iconETC = '${assetsRoot}/etc.png';
const iconDAI = '${assetsRoot}/dai.png';
const iconBUSD = '${assetsRoot}/busd.png';
const iconUNI = '${assetsRoot}/etc.png';

///
///
///
var coinETH = ethTokens['ETH'];
var coinUSDT = ethTokens['USDT'];
var coinBUSD = ethTokens['BUSD'];
var coinUNI = ethTokens['UNI'];
var coinDAI = ethTokens['DAI'];

///
/// eth token 合约地址信息:
///   - https://github.com/MetaMask/contract-metadata/blob/master/contract-map.json
///   - https://raw.githubusercontent.com/MyEtherWallet/ethereum-lists/master/dist/master-file.json
///
/// 测试链换币:
///   - https://app.uniswap.org/#/swap
///     - uniswap 的测试链
///
/// 测试链:
///   - token list:
///     - 搜索: https://kovan.etherscan.io/tokens
///     - https://kovan.etherscan.io/tokens-nft
///     - USDT: https://kovan.etherscan.io/token/0xf3e0d7bf58c5d455d31ef1c2d5375904df525105
///     - univ2: https://kovan.etherscan.io/dapp/0xf4c83715ca56145c5d700c3b2bfc5c0324050792
///     - daiV1: https://kovan.etherscan.io/token/0xc4375b7de8af5a38a93548eb8453a498222c4ff2
var ethTokens = <String, TokenOption>{
  'ETH': TokenOption(
    symbol: 'ETH',
    name: 'ETH',
    logo: iconETH,
  ),

  ///
  ///
  ///
  'USDT': TokenOption(
    address: '0xdAC17F958D2ee523a2206206994597C13D831ec7',
    addressTest: '0xf3e0d7bf58c5d455d31ef1c2d5375904df525105',
    // 测试链地址: kovan
    symbol: 'USDT',
    name: 'Tether USD',
    logo: iconUSDT,
    // 合约协议类型:
    isErc20: true,
    isErc721: false,
    // 小数精度位数:
    decimals: 6,
  ),

  'DAI': TokenOption(
    address: '0x6B175474E89094C44Da98b954EedeAC495271d0F',
    addressTest: '0xc4375b7de8af5a38a93548eb8453a498222c4ff2',
    symbol: 'DAI',
    name: 'Dai Stablecoin',
    logo: iconDAI,
    isErc20: true,
    isErc721: false,
    decimals: 18,
  ),

  'UNI': TokenOption(
    address: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
    addressTest: '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
    // 有效, 测试专用
    symbol: 'UNI',
    name: 'Uniswap',
    logo: iconUNI,
    isErc20: true,
    isErc721: false,
    decimals: 18,
  ),

  'BUSD': TokenOption(
    address: '0x4Fabb145d64652a948d72533023f6E7A623C7C53',
    addressTest: '0x23c587972b49d593531e56c8c659a8d22b12ec1e',
    symbol: 'BUSD',
    name: 'Binance USD',
    logo: iconBUSD,
    isErc20: true,
    isErc721: false,
    decimals: 18,
  ),
};
