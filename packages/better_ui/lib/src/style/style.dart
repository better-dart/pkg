import '../index.dart';

///
/// 基础样式:
///
class BetterStyle {
  ///
  /// Container 默认样式风格:
  Widget box({
    @required Widget child,

    ///
    bool withCard = false, // 包装
    bool withGradient = false, // 背景渐变色
    bool withSafeArea = false, // 顶部/头部保护区域
    double width,
    double height,
    BorderRadiusGeometry borderRadius,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,

    //
    Color backgroundColor, // 背景色
    List<Color> backgroundColors, // 渐变色:
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) =>
      useBox(
        child: child,

        ///
        withCard: withCard,
        withGradient: withGradient,
        withSafeArea: withSafeArea,
        width: width,
        height: height,
        borderRadius: borderRadius,
        padding: padding,
        margin: margin,

        ///
        backgroundColor: backgroundColor,
        backgroundColors: backgroundColors,
        begin: begin,
        end: end,
      );

  /// 分割线:
  Widget divider({
    Color color,
    double height,
    double indent,
    double endIndent,
    double thickness,
  }) =>
      useDivider(
        color: color,
        height: height,
        indent: indent,
        endIndent: endIndent,
        thickness: thickness,
      );
}
