@JS('@walletconnect/client')
library wallet_connect;

import 'package:js/js.dart';

/// WalletConnect Dart SDK.
///
/// original repo:
///   - https://github.com/WalletConnect/walletconnect-monorepo/tree/next/packages/clients/client
///
@JS()
class WalletConnect {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
