import 'package:flutter/services.dart';
import 'package:get/get.dart';

mixin CopyMixin {
  void sysCopy(String text) {
    Clipboard.setData(ClipboardData(text: text));

    Get.snackbar(
      'Copy Succeed!',
      'copy to clipboard!',
      duration: Duration(seconds: 1),
      backgroundColor: Get.theme.primaryColor,
    );
  }
}
