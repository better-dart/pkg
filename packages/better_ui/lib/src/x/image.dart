import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../index.dart';

mixin ImageMixin {
  Widget svgAsset({
    required String assetName,
    double? height,
    double? width,
  }) {
    return SvgPicture.asset(
      assetName,
      height: height ?? 24,
      width: width ?? 24,
    );
  }

  Widget image({
    required String from,
    double? radius,
    double? size,
    bool isNet = false,
  }) {
    var notFound = 'https://via.placeholder.com/150/000000/FFFFFF/?text=404';
    return isNet
        ? ui.util.networkImage(url: from, radius: radius, size: size)
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 10),
            child: Image.asset(
              from,
              width: size ?? Get.width / 8,
              height: size ?? Get.width / 8,
            ),
          );
  }

  /// 图片:
  Widget networkImage({
    required String url,
    double? radius,
    double? size,
  }) {
    // print('image url: $url');

    return CachedNetworkImage(
      imageUrl: url,

      ///
      imageBuilder: (context, imageProvider) => Container(
        /// 默认宽度:
        width: size ?? Get.width / 8,
        height: size ?? Get.width / 8,

        decoration: BoxDecoration(
          /// 圆角:
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(color: Colors.grey.withAlpha(50)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          ),
        ),
      ),

      /// 加载中:
      placeholder: (context, url) => CircularProgressIndicator(),

      /// 错误显示:
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
