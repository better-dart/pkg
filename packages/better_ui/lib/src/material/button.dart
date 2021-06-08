import '../../better_ui.dart';

///
///
///
class BetterButton {
  /// 后退:
  Widget back({VoidCallback? backFn, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: Icon(Icons.arrow_back_ios, size: size ?? 18, color: color),
        onTap: () {
          /// before back
          if (backFn != null) {
            backFn();
          }

          /// back:
          Get.back();
        },
      );

  /// 前进:
  Widget forward({VoidCallback? onTap, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: Icon(Icons.arrow_forward_ios, size: size ?? 18, color: color),
        onTap: onTap,
      );

  /// 添加:
  Widget add({VoidCallback? onTap, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: Icon(Icons.add, size: size ?? 18, color: color),
        onTap: onTap,
      );

  /// 搜索:
  Widget search({VoidCallback? onTap, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: Icon(Icons.search, size: size ?? 18, color: color),
        onTap: onTap,
      );

  /// 关闭:
  Widget close({VoidCallback? onTap, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: Icon(Icons.close, size: size ?? 18, color: color),
        onTap: onTap,
      );

  /// 扫描二维码:
  Widget qrScan({VoidCallback? onTap, Color? color, double? size, EdgeInsetsGeometry? margin}) => buildIcon(
        margin: margin,
        child: SvgPicture.asset(
          iconScan,
          color: color ?? (Get.isDarkMode ? Colors.white : null),
          height: 18.0,
          width: 18.0,
        ),
        onTap: onTap,
        useInk: true,
      );

  ////////////////////////////////////////////////////////////////////////////////////

  /// 三元按钮组:
  Widget? threeButtons() {
    return null;
  }

  /// 文本按钮:
  Widget buildText({
    Widget? title,
    String? titleText,
    VoidCallback? onTap,
    Color? color,
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? Get.width * 0.3,
        padding: padding ?? EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? ui.color.SUCCESS,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
        ),
        child: Center(
          child: title ??
              Text(
                titleText!,
                style: TextStyle(color: Colors.white),
              ),
        ),
      ),
    );
  }

  ///
  /// 构建按钮(Icon or Text):
  ///
  Widget buildIcon({
    Widget? child,
    VoidCallback? onTap,
    Color? color,
    BorderRadiusGeometry? borderRadius,
    double? size,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    bool useInk = false, // 点击效果:
  }) {
    var item = child ??
        Icon(
          Icons.arrow_back_ios,
          size: size ?? 18,
          color: color,
        );

    return useInk
        ? InkWell(
            onTap: onTap,
            child: Container(
              margin: margin,
              padding: padding ?? EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius ?? BorderRadius.circular(5),
              ),
              child: Center(
                child: item,
              ),
            ),
          )
        : IconButton(
            icon: item,
            onPressed: onTap,
          );
  }

  ///
  /// 图标+文本:
  ///   - 支持 垂直/水平 布局
  ///   - 支持 text/icon 位置互换
  ///
  Widget buildIconText({
    Widget? title,
    Widget? icon,
    String titleText = 'click',
    String iconUrl = '',
    double? iconSize,
    double? iconRadius,

    ///
    double? fontSize,
    double? gapSize, // 两个组件间隙
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    GestureTapCallback? onTap, // 可点击
    bool vertical = true, // 垂直方向布局
    bool reverse = false, // 布局顺序: 反转 (上下/左右)
  }) {
    var items = [
      /// icon:
      (icon != null)
          ? icon
          : (iconUrl != '')
              ? Container(
                  width: iconSize ?? 45,
                  height: iconSize ?? 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(iconRadius ?? 15)),
                    color: Get.theme.primaryColor,
                    image: DecorationImage(image: AssetImage(iconUrl), fit: BoxFit.cover),
                  ),
                )
              // ClipOval(
              //             child: Image.asset(
              //               iconUrl,
              //               width: iconSize ?? 45,
              //               fit: BoxFit.cover,
              //             ),
              //           )
              : Icon(
                  Icons.favorite_border,
                  color: Colors.blueAccent,
                ),
    ];

    /// 插入位置:
    var index = reverse ? 0 : 1;

    /// add text:
    items.insert(
      index,
      title ??
          Text(
            titleText,
            maxLines: 3,
            softWrap: true,
            style: TextStyle(fontSize: fontSize ?? 11),
          ),
    );

    /// 间隙: 若 grid 出现组件溢出, 需调整 grid childAspectRatio 值
    items.insert(1, vertical ? SizedBox(height: gapSize ?? 0) : SizedBox(width: gapSize ?? 8));

    /// 布局方向:
    var child = vertical ? Column(children: items) : Row(children: items);

    return InkWell(
      onTap: onTap ?? () => Get.defaultDialog(title: 'hi', content: Text('sweetheart')),
      child: Container(
        child: Center(child: child),

        ///
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          color: backgroundColor,
        ),
      ),
    );
  }
}
