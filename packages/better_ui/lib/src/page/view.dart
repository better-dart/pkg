import '../../better_ui.dart';

/// 标准页面:
Widget stdView({
  Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
  Widget? title,
  String? titleText,
  bool centerTitle = true,
  bool resizeToAvoidBottomInset = false,
  Color? backgroundColor,
  VoidCallback? backFn, // 返回附加函数
  Widget? leading,
  List<Widget>? actions,

  ///
  required Widget body,
  Widget? bottomNavigationBar,
}) {
  return Scaffold(
    /// header:
    appBar: ui.layout.appBar.classic(
      preferredSize: preferredSize,
      title: title,
      titleText: titleText,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      backFn: backFn,
      leading: leading,
      actions: actions,
    ) as PreferredSizeWidget?,

    /// content:
    body: body,

    /// footer:
    bottomNavigationBar: bottomNavigationBar,

    /// 输入框问题:
    resizeToAvoidBottomInset: resizeToAvoidBottomInset, //输入框抵住键盘 内容不随键盘滚动
  );
}
