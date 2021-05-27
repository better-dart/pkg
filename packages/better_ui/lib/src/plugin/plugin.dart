import 'package:flutter_swiper/flutter_swiper.dart';

import '../index.dart';

///
/// 插件 wrap:
///
class BetterPlugin {
  /// 图片轮播:
  Widget buildSlide({
    Key key,
    @required int itemCount,
    @required IndexedWidgetBuilder itemBuilder,

    ///
    ValueChanged<int> onIndexChanged,

    ///
    bool autoPlay,
    int duration,
    int autoPlayDelay,
    SwiperPlugin pagination,
    SwiperLayout layout,
  }) =>
      useSlide(
        key: key,
        itemCount: itemCount,
        itemBuilder: itemBuilder,

        ///
        onIndexChanged: onIndexChanged,

        ///
        autoPlay: autoPlay,
        autoPlayDelay: autoPlayDelay,
        duration: duration,
        pagination: pagination,
        layout: layout,
      );
}
