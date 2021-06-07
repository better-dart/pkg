import '../../better_ui.dart';

///
/// 自定义 模板页面:
///
var tpl = BetterTemplate();

///
/// 积累通用模板页面套件:
///   - 避免重复写页面
///
class BetterTemplate {
  ///
  /// 我的页面:
  ///
  Widget? meView() {
    return null;
  }

  ///
  /// 设置页面:
  ///
  Widget? settingView() {
    return null;
  }

  ///
  /// 登录页面:
  ///
  Widget? loginView() {
    return null;
  }

  ///
  /// 登录页面:
  ///
  Widget notFoundView({String? titleText}) {
    return useNotFoundView(titleText: titleText);
  }
}
