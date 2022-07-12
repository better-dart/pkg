import 'index.dart';

///
/// 注入到此:
///
abstract class BetterUIInterface {}

///
/// for global use
///
final betterUI = BetterUI();
final ui = betterUI;
final UI = betterUI;

///
/// 常用默认统一 UI:
///   - 避免重复代码
///
class BetterUI extends BetterUIInterface with SetupMixin, ViewMixin, PrintMixin, ImageMixin, FormMixin, ListMixin, GridMixin, ButtonMixin {
  /// 自定义通用模板页面集: (常用注册/登录/设置/我的/购物车等)
  BetterTemplate get template => BetterTemplate();

  /// 自定义样式:
  BetterStyle get style => BetterStyle();

  /// 自定义颜色:
  BetterColor get color => BetterColor();

  /// 页面 wrap 方法集:
  BetterWrap get wrap => BetterWrap();

  /// 第三方插件 wrap 集合:
  BetterPlugin get plugin => BetterPlugin();

  /// 标题 bar:
  BetterAppBar get appBar => BetterAppBar();

  /// 按钮:
  BetterButton get button => BetterButton();

  /// 文本组件:
  BetterTextField get field => BetterTextField();

  /// 工具方法:
  BetterPlugin get util => BetterPlugin();

  /// 空组件 占位符:
  Widget get empty => SizedBox();

  /////////////////////////////////////////////////////////////////////////////////////////////////
  /// shortcuts for api:
  ///   - 各种 API 的快捷调用
  ///
  /////////////////////////////////////////////////////////////////////////////////////////////////

}
