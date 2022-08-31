import '../../better_ui.dart';

class BetterAppBar with AppBarMixin {}

///
/// 典型布局:
///
mixin AppBarMixin {
  ///
  /// 通用 bar:
  ///   - 支持居中
  ///   - 支持压缩 bar 高度
  ///
  Widget classic({
    Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
    Widget? title,
    String? titleText,

    /// 控制 bar 标题位置: 是否避开系统状态栏
    bool? primary,
    bool centerTitle = true,
    Color? backgroundColor,
    VoidCallback? backFn, // 返回附加函数
    Widget? leading,
    List<Widget>? actions,
  }) {
    return newAppBar(
      preferredSize: preferredSize,
      title: title,
      titleText: titleText,

      /// 控制 bar 标题位置: 是否避开系统状态栏
      primary: primary,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      backFn: backFn,

      ///
      leading: leading ?? ui.button.back(backFn: backFn),

      ///
      actions: actions,
    );
  }

  ///
  /// 默认样式:
  ///
  Widget newTabBar({
    required List<Widget> titles,
    List<Widget>? actions, // 尾
    VoidCallback? backFn, // 返回附加函数

    ///
    bool centerTitle = true,
    bool? isScrollable,
    double? fontSize,
    double? indicatorWeight,
    Color? backgroundColor,
    Color? labelColor,
    Color? unselectedLabelColor,
    Color? indicatorColor,
  }) {
    return TabBar(
      /// title list
      tabs: titles,

      ///
      isScrollable: isScrollable ?? true,

      ///
      labelStyle: TextStyle(fontSize: fontSize ?? 14, fontWeight: FontWeight.bold),

      /// 选中颜色:
      labelColor: labelColor ?? (Get.isDarkMode ? null : Get.theme.primaryColor),

      /// 选中颜色
      unselectedLabelColor: unselectedLabelColor ?? Get.theme.unselectedWidgetColor,

      /// 下标:
      indicatorColor: indicatorColor ?? Get.theme.primaryColor,

      /// 选择器的大小:
      indicatorWeight: indicatorWeight ?? 3.0,

      /// 选择器宽度:
      indicatorSize: TabBarIndicatorSize.label,

      /// tab 间隔空间:
      labelPadding: EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
    );
  }

  ///
  /// tab bar:
  ///   - 支持居中
  ///   - 支持压缩 bar 高度
  ///
  Widget withTab({
    required List<Widget> titles,
    VoidCallback? backFn, // 返回附加函数
    Widget? leading, // 头
    List<Widget>? actions, // 尾

    ///
    bool centerTitle = true,

    /// 控制 bar 标题位置: 是否避开系统状态栏
    bool? primary,
    double? fontSize,
    double? indicatorWeight,
    Color? backgroundColor,
    Color? indicatorColor,
    Color? labelColor,
    Color? unselectedLabelColor,
    Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
  }) {
    return newAppBar(
      /// 高度压缩:
      preferredSize: preferredSize,

      /// 控制 bar 标题位置: 是否避开系统状态栏
      primary: primary,

      ///
      title: newTabBar(
        titles: titles,
        actions: actions,
        backFn: backFn,

        ///
        centerTitle: centerTitle,
        fontSize: fontSize,
        indicatorWeight: indicatorWeight,
        indicatorColor: indicatorColor,
        unselectedLabelColor: unselectedLabelColor,
        labelColor: labelColor,
      ),

      ///
      centerTitle: centerTitle,

      ///
      backgroundColor: backgroundColor,

      /// back hook:
      backFn: backFn,

      /// 头:
      leading: leading,

      /// 尾:
      actions: actions,

      /// 如果不使用, 需要赋值给空.
      bottom: null,
    );
  }

  @deprecated
  Widget Function() get sliverHeader => newSliverAppBar;

  ///
  ///
  /// 内部最终是依赖 AppBar()
  ///
  Widget newSliverAppBar({
    String titleText = 'title', // 标题文本
    Widget? title, // 标题组件
    Widget? leading, // 头
    VoidCallback? backFn, // 返回附加函数
    List<Widget>? actions, // 尾

    /// flex part:
    Widget? flexTitle, // 折叠标题
    Widget? flexibleSpace, // 折叠区域
    Widget? flexBackground, // 折叠背景(图片)

    ///
    bool isBottomTitle = false,
    bool isSplitSysBar = false, // 是否与系统状态栏切分, 背景图覆盖 // 沉浸式: 合并系统状态栏
    bool centerTitle = true, // 标题居中
    bool? pinned,
    bool? snap,
    bool? floating,
    IconThemeData? iconTheme, // 图标配色
    Color? backgroundColor, // 背景色
    Brightness? brightness, // 状态栏
    double? expandedHeight, // 头部可折叠部分高度
    double? collapsedHeight, // 折叠区域高度
    double? elevation, // 底线
  }) {
    /// 定制标题:
    var barTitle = (title != null)
        ? title
        : Text(
            titleText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,

              /// 字体颜色: 支持 darkMode
              color: Get.isDarkMode ? null : Get.textTheme.headline6!.color,
            ),
          );

    /// 适配 bottom:
    barTitle = PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: barTitle,
    );

    return SliverAppBar(
      /// 标题位置:顶部
      title: isBottomTitle ? null : barTitle,

      /// 标题位置: 底部
      bottom: isBottomTitle ? barTitle as PreferredSizeWidget? : null,

      /// 头:
      leading: leading ?? ui.button.back(backFn: backFn),

      /// 尾:
      actions: actions ??
          [
            IconButton(
                icon: Icon(Icons.home, size: 20), // 控制组件大小
                onPressed: () {
                  Get.snackbar(
                    '',
                    'Hi, Friend!',
                    colorText: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                  );
                }),
          ],

      /// 居中:
      centerTitle: true,

      /// 设置背景为全白色:
      backgroundColor: backgroundColor ?? (Get.isDarkMode ? null : Colors.white),

      /// 控制系统状态栏字体颜色:
      brightness: brightness ?? (Get.isDarkMode ? Brightness.dark : Brightness.light),

      /// AppBar 底部下划线-隐藏阴影
      elevation: elevation ?? 0.0,

      /// 设置 icon 配色: for drawer
      iconTheme: iconTheme ??
          IconThemeData(
            color: Get.isDarkMode ? null : Get.theme.unselectedWidgetColor,
          ),

      /// 展开的高度
      expandedHeight: expandedHeight ?? Get.height * 0.2,

      /// 折叠后高度:
      collapsedHeight: collapsedHeight,

      // 强制显示阴影
      forceElevated: true,

      /// 设置该属性，当有下滑手势的时候，就会显示 AppBar
      floating: floating ?? true,
      // 该属性只有在 floating 为 true 的情况下使用，不然会报错
      // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
      // 当下滑到一定比例，会自动把 AppBar 展开
      snap: snap ?? true,

      /// 设置该属性使 Appbar 折叠后不消失
      pinned: true,

      /// 通过这个属性设置 AppBar 的背景
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
            /// 标题:
            title: flexTitle ?? Text('Expanded Title'),

            /// 背景图:
            background: flexBackground,

            /// 背景折叠动画
            collapseMode: CollapseMode.parallax,
          ),
    );
  }

  ///
  /// 个人定制 header, 样式要重新写, 参考 appBar() 实现.
  ///
  Widget sliverHeader2({
    bool? pinned,
  }) {
    return SliverPersistentHeader(
      delegate: BetterSliverPersistentHeaderDelegate(
          child: Container(
        child: Text('title'),
      )),
      pinned: pinned ?? true,
      floating: true,
    );
  }

  ///
  /// build bar:
  /// - 支持居中
  /// - 支持压缩 bar 高度
  ///
  Widget newAppBar({
    /// 标题:
    Widget? title,
    String? titleText,
    bool centerTitle = true,

    /// 返回附加函数
    VoidCallback? backFn,

    /// 头:
    Widget? leading,

    /// 尾:
    List<Widget>? actions,

    /// 如果不使用, 需要赋值给空.
    PreferredSizeWidget? bottom,

    /// 控制 bar 标题位置: 是否避开系统状态栏
    bool? primary,

    /// config:
    Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
    Color? backgroundColor,
    IconThemeData? iconTheme, //
    Brightness? brightness,
    double? elevation,
    double? titleSpacing,
  }) {
    var bar = AppBar(
      /// 控制 bar 标题位置: 是否避开系统状态栏
      primary: primary ?? true,

      /// 标题:
      title: title ??
          Text(
            titleText!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,

              /// 字体颜色: 支持 darkMode
              color: Get.isDarkMode ? null : Get.textTheme.headline6!.color,
            ),
          ),
      centerTitle: centerTitle,

      /// 头: 必然存在
      leading: leading,

      /// 尾:
      actions: actions,

      ////////////////////////////////////////////////////

      /// 设置 icon 颜色: for drawer
      iconTheme: iconTheme ??
          IconThemeData(
            color: Get.isDarkMode ? null : Get.theme.unselectedWidgetColor,
          ),

      /// 设置背景为全白色:
      backgroundColor: backgroundColor ?? (Get.isDarkMode ? null : Colors.white),

      /// 控制系统状态栏字体颜色:
      brightness: brightness ?? (Get.isDarkMode ? Brightness.dark : Brightness.light),

      /// AppBar 底部下划线-隐藏阴影
      elevation: elevation ?? 0.0,
      titleSpacing: titleSpacing ?? 0.0,

      /// 如果不使用, 需要赋值给空.
      bottom: bottom,
    );

    /// 高度压缩:
    return preferredSize != null
        ? PreferredSize(
            preferredSize: preferredSize,
            child: bar,
          )
        : bar;
  }
}
