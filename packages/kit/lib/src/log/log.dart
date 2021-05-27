import 'package:logger/logger.dart';

import 'log_printer.dart';

///
/// global logger:
///
final logger = Logger(
  printer: HybridPrinter(
    BetterPrettyPrinter(methodCount: 1),
    // debug: SimplePrinter(),
    info: BetterPrettyPrinter(methodCount: 0),
    error: BetterPrettyPrinter(methodCount: 8),
  ),

  // printer: PrefixPrinter(
  //   HybridPrinter(
  //     BetterPrettyPrinter(methodCount: 1),
  //     // debug: SimplePrinter(),
  //     warning: BetterPrettyPrinter(methodCount: 1),
  //     error: BetterPrettyPrinter(methodCount: 2),
  //   ),
  //   debug: '> debug 🐛',
  //   info: '> info 🚀',
  //   warning: '> warning ⚠️',
  //   error: '> error ⛔',
  // ),
);
