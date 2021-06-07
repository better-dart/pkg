import '../../index.dart';

/// 图片轮播:
Widget useSlide({
  Key? key,
  required int itemCount,
  required IndexedWidgetBuilder itemBuilder,

  ///
  ValueChanged<int>? onIndexChanged,

  ///
  bool? autoPlay,
  int? duration,
  int? autoPlayDelay,
  SwiperPlugin? pagination,
  SwiperLayout? layout,
}) {
  return Swiper(
    key: key,
    autoplay: autoPlay ?? true,
    duration: duration ?? 600,
    autoplayDelay: autoPlayDelay ?? 6000,
    layout: layout ?? SwiperLayout.DEFAULT,
    // 延迟时间
    pagination: pagination ??
        SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            size: 4,
            activeSize: 6,
          ), // 分页标记
        ),
    // control: SwiperControl(),

    ///
    itemCount: itemCount,
    itemBuilder: itemBuilder,

    ///
    onIndexChanged: onIndexChanged,
  );
}
