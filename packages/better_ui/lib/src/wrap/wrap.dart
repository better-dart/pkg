import '../index.dart';

///
/// 常用 wrap hook:
///
class BetterWrap {
  ///
  /// 含输入组件的页面:
  ///   - 自动隐藏键盘输入法
  ///
  Widget inputView({required Widget child}) => useInputWrap(child: child);

  /// 单行布局均匀分布:
  Widget rowFit({required List<Widget> children}) => wrapRowFit(children: children);

  /// 添加保护区域:
  Widget safeArea({
    required Widget child,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) =>
      wrapSafeArea(child: child, left: left, top: top, right: right, bottom: bottom);

  ///
  /// 异步加载等待对话框:
  /// - https://stackoverflow.com/questions/61307264/autoclose-dialog-in-flutter
  /// - https://stackoverflow.com/questions/49706046/how-to-run-code-after-showdialog-is-dismissed-in-flutter
  void loadingDialog({
    int milliseconds = 1000,
    Future<dynamic> Function()? waitDo, // 当前异步 task
    GestureTapCallback? afterTo, // 等待完毕, 跳转操作
  }) {
    ///
    ///
    ///
    showDialog(
        context: Get.context!,
        builder: (context) {
          /// wait some task done:
          waitDo!();

          /// 延迟:
          Future.delayed(
            Duration(milliseconds: milliseconds ?? 1000),
            () {
              /// auto close:
              // Navigator.of(context).pop();
              Get.back();
            },
          );
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text('加载中'),
            content: SingleChildScrollView(
              child: Text('加载中....'),
            ),
          );
        }).whenComplete(
      () {
        ///
        /// call after hook:
        ///
        afterTo!();
      },
    );
  }
}
