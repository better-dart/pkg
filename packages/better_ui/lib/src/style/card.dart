import 'dart:ui';

import '../index.dart';

typedef Widget BoxFunction({
  Color? backgroundColor,
  List<Color>? backgroundColors,
  AlignmentGeometry begin,
  BorderRadiusGeometry? borderRadius,
  required Widget child,
  AlignmentGeometry end,
  double? height,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  double? width,
  bool withCard,
  bool withGradient,
  bool withSafeArea,
});

///
/// 默认样式风格:
///   - 支持 card wrap
///   - 支持 黑色主题
///   - 支持 渐变色背景
///
Widget useBox({
  required Widget child,

  ///
  bool withCard = false, // 包装
  bool withGradient = false, // 背景渐变色
  bool withSafeArea = false, // 顶部/头部保护区域
  double? width,
  double? height,
  BorderRadiusGeometry? borderRadius,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,

  //
  Color? backgroundColor, // 背景色
  List<Color>? backgroundColors, // 渐变色:
  AlignmentGeometry begin = Alignment.centerLeft,
  AlignmentGeometry end = Alignment.centerRight,
}) {
  var bgColor = Get.isDarkMode ? null : Colors.white;

  var box = Container(
    /// 保护区域:
    child: withSafeArea ? SafeArea(child: child) : child,

    /// style:
    width: width,
    height: height,
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(15),
      color: withGradient ? null : backgroundColor ?? bgColor, // 基础背景色
      gradient: withGradient // 渐变色
          ? LinearGradient(
              // 背景渐变色
              colors: backgroundColors ??
                  [
                    Color(0xff465EFB),
                    Color(0xffC346C2),
                    // Color(0xffFF52E5),
                    // Color(0xff79F1A4),
                    // Color(0xffCA26FF),
                    // Color(0xFFfbab66),
                    // Color(0xFFf7418c),
                  ],
              begin: begin,
              end: end,
            )
          : null,
    ),
  );

  var card = withCard ? Card(child: box) : box;
  return card;
}

///
/// 毛玻璃效果:
///
Widget useGrassyBox({
  required Widget child,
  double? width,
  double? height,
  double radius = 15.0,
  List<Color>? colors,
  AlignmentGeometry begin = Alignment.centerLeft,
  AlignmentGeometry end = Alignment.centerRight,
}) {
  var box = Container(
    decoration: BoxDecoration(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.grey.shade200.withOpacity(0.5),
        ),
        child: child,
      ),
    ),
  );

  return box;
}

typedef Widget RowFunc({required List<Widget> children});

/// 单行均匀布局: 填充/铺满间隙
Widget wrapRowFit({required List<Widget> children}) {
  var items = <Widget>[Spacer()];

  /// 添加间隙:
  for (var child in children) {
    items.addAll([child, Spacer()]);
  }

  return Container(child: Row(children: items));
}

typedef Widget SafeAreaFunc({
  required Widget child,
  bool left,
  bool top,
  bool right,
  bool bottom,
});

/// 组件安全区域保护:
Widget wrapSafeArea({
  required Widget child,
  bool left = true,
  bool top = true,
  bool right = true,
  bool bottom = true,
}) {
  return SafeArea(
    child: child,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
}
