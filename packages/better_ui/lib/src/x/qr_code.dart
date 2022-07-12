import 'package:better_ui/better_ui.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

mixin QrCodeMixin {
  Future<String> qrCodeScan({Widget? scanView}) async {
    try {
      var res = await Get.to<String>(scanView ?? QrScanView());
      print('qr scan result: $res');
      return res ?? '';
    } catch (e) {
      print('qr scan error: $e');
    }
    return '';
  }
}

class QrScanView extends StatelessWidget {
  final controller = ScanController();

  final String? titleText;
  final Color? color;
  final double? scanAreaScale;

  QrScanView({this.titleText, this.color, this.scanAreaScale});

  @override
  Widget build(BuildContext context) {
    return ui.buildStdView(
      titleText: titleText ?? 'Scan',
      body: Stack(
        children: [
          ScanView(
            controller: controller,
            scanAreaScale: scanAreaScale ?? .7,
            scanLineColor: color ?? Get.theme.primaryColor,
            onCapture: (data) {
              Get.back(result: data);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.5),
            child: Center(
              child: ui.buildIconButton(
                child: Icon(
                  Icons.flash_on,
                  size: 36,
                  color: color ?? Get.theme.primaryColor,
                ),
                onTap: () {
                  controller.toggleTorchMode();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
