import '../index.dart';
import 'image.dart';

///
///
///
class BetterUtil {
  /// 网络图片+缓存:
  Widget NetworkImage({@required String url, double radius, double size}) => networkImage(
        url: url,
        radius: radius,
        size: size,
      );
}
