import 'package:flutter/material.dart';

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
  RowFunc get rowFit => wrapRowFit;

  /// 添加保护区域:
  SafeAreaFunc get safeArea => wrapSafeArea;

  ///
  /// 异步加载等待对话框:
  /// - https://stackoverflow.com/questions/61307264/autoclose-dialog-in-flutter
  /// - https://stackoverflow.com/questions/49706046/how-to-run-code-after-showdialog-is-dismissed-in-flutter
  DialogFunc get loadingDialog => showLoadingDialog;
}
