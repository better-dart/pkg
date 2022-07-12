import '../index.dart';

mixin PrintMixin {
  print(Object? object) => logDebug(object);

  logDebug(Object? object) => GetPlatform.isIOS ? debugPrint('🐛 \t>> $object') : debugPrint('\x1B[32m 🐛 \t>> $object\x1B[0m');

  logErr(Object? object) => GetPlatform.isIOS ? debugPrint('⛔ \t>> $object') : debugPrint('\x1B[31m ⛔ \t>> $object\x1B[0m');

  logWarn(Object? object) => GetPlatform.isIOS ? debugPrint('💡 \t>> $object') : debugPrint('\x1B[36m 💡 \t>> $object\x1B[0m');
}
