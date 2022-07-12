import 'package:get/get.dart';

import '../../better_ui.dart';

mixin DialogMixin {
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
            Duration(milliseconds: milliseconds),
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
