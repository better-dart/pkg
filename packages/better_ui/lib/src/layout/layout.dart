import 'appbar.dart';
import 'body.dart';
import 'bottom.dart';

///
/// 布局:
///
var layout = BetterLayout();

///
/// 自定义布局:
///
class BetterLayout {
  /// 标题 bar:
  final appBar = BetterAppBar();

  /// 内容:
  final body = BetterBody();

  /// 底部 bar:
  final bottom = BetterBottom();
}
