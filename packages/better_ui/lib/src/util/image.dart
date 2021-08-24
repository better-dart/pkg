import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../index.dart';

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
