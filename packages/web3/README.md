# web3

- web3 wallet utils
- support eth, bsc

## Getting Started

```yaml

  web3: ^1.0.5

```

- how to use:

```dart
import 'package:web3/web3.dart';

void main() async {
    const rpcUrl = 'https://kovan.infura.io/v3/your_api_key';

    /// wallet client:
    var client = EthWallet(url: rpcUrl);

    /// hd wallet:
    var hd = await client.genHDWallet();

    var address = 'your_wallet_address';
    var result = await client.getBalance(address: address);
    print('get balance : $result');
}


```

- [unit test](./test)


## ref:

- https://github.com/simolus3/web3dart
- https://github.com/mockturtl/dotenv
- https://github.com/trustwallet/wallet-core
