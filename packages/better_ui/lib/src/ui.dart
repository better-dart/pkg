import 'index.dart';

///
/// for global use
///
final betterUI = BetterUI();
final ui = betterUI;

///
/// 常用默认统一 UI:
///   - 避免重复代码
///
class BetterUI {
  /// 自定义通用模板页面集: (常用注册/登录/设置/我的/购物车等)
  final BetterTemplate template = BetterTemplate();

  /// 自定义页面: 常用组合范式
  final BetterPage page = BetterPage();

  /// 页面 wrap 方法集:
  final BetterWrap wrap = BetterWrap();

  /// 第三方插件 wrap 集合:
  final BetterPlugin plugin = BetterPlugin();

  /// 自定义布局:
  final BetterLayout layout = BetterLayout();

  /// 自定义样式:
  final BetterStyle style = BetterStyle();

  /// 自定义组件集合:
  final BetterMaterial material = BetterMaterial();

  /// 自定义颜色:
  final BetterColor color = BetterColor();

  /// 工具方法:
  final BetterUtil util = BetterUtil();

  /// 空组件 占位符:
  final Widget empty = SizedBox();

  /////////////////////////////////////////////////////////////////////////////////////////////////
  /// shortcuts for api:
  ///   - 各种 API 的快捷调用
  ///
  /////////////////////////////////////////////////////////////////////////////////////////////////

  /// 标准页面:
  Widget buildStdView({
    Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
    Widget? title,
    String? titleText,
    bool centerTitle = true,
    bool resizeToAvoidBottomPadding = false,
    Color? backgroundColor,
    VoidCallback? backFn, // 返回附加函数
    Widget? leading,
    List<Widget>? actions,

    ///
    required Widget body,
    Widget? bottomNavigationBar,
  }) {
    return page.stdView(
      preferredSize: preferredSize,
      title: title,
      titleText: titleText,
      centerTitle: centerTitle,
      resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
      backgroundColor: backgroundColor,
      backFn: backFn,
      leading: leading,
      actions: actions,

      ///
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  ///
  /// 默认页面布局:
  ///   - 支持 滑动 标题(也支持隐藏: hasHeader = false)
  ///
  Widget buildScrollView({
    ScrollController? controller,
    String titleText = '', // 标题文本
    Widget? title, // 标题组件
    Widget? leading, // 头
    VoidCallback? backFn, // 返回附加函数
    List<Widget>? actions, // 尾

    ///
    required List<Widget> bodySlivers, // 二选一: [bodySlivers, body] 常用: 内容布局集
    Widget? body, // 二选一: [bodySlivers, body] 嵌套一个页面(支持自身页面嵌套)

    /// flex part:
    Widget? flexTitle, // 折叠标题
    Widget? flexibleSpace, // 折叠区域
    Widget? flexBackground, // 折叠背景(图片)

    ///
    bool hasAppBar = true, // 是否去除 appbar
    bool hasHeader = true, // 默认添加 可折叠 header 部分, 可隐藏
    bool isBottomTitle = false,
    bool isSplitSysBar = false, // 是否与系统状态栏切分, 背景图覆盖 // 沉浸式: 合并系统状态栏
    bool pinned = true,
    bool centerTitle = true, // 标题居中
    /// 页面允许滚动(最末控制)
    bool hasScrollBody = true,
    IconThemeData? iconTheme, // 图标配色
    Color? backgroundColor, // 背景色
    Brightness? brightness, // 状态栏
    double? expandedHeight, // 头部可折叠部分高度
    double? collapsedHeight, // 折叠区域高度
    double? elevation, // 底线
  }) {
    return page.scrollView(
      controller: controller,
      titleText: titleText,
      title: title,
      leading: leading,
      backFn: backFn,
      actions: actions,

      ///
      bodySlivers: bodySlivers,
      body: body,

      ///
      flexTitle: flexTitle,
      flexibleSpace: flexibleSpace,
      flexBackground: flexBackground,

      ///
      hasAppBar: hasAppBar,
      hasHeader: hasHeader,
      isBottomTitle: isBottomTitle,
      isSplitSysBar: isSplitSysBar,
      pinned: pinned,
      centerTitle: centerTitle,
      hasScrollBody: hasScrollBody,
      iconTheme: iconTheme,
      barBackgroundColor: backgroundColor,
      brightness: brightness,
      expandedHeight: expandedHeight,

      /// 折叠区域高度
      collapsedHeight: collapsedHeight,
      elevation: elevation,
    );
  }

  /// 内嵌 tab 页面: 压缩标题高度
  Widget buildTabNestedView({
    required List<Widget> titles, // tab 标题
    required List<Widget> pages, // tab body

    ///
    Widget? drawer,
    Widget? leading,
    List<Widget>? actions, // tab actions

    /// 转换适配 sliver 页面:
    bool toSliver = false,
    bool centerTitle = false,

    /// 避免底部空白, 页面允许滚动(最末控制)
    bool hasScrollBody = true,
  }) {
    return buildTabView(
      titles: titles,
      pages: pages,
      drawer: drawer,
      leading: leading,
      actions: actions,

      /// 内嵌 tab 页面, 控制标题位置: 是否避开系统状态栏
      primary: false,

      /// 内嵌 tab 页面, 压缩标题栏高度
      preferredSize: Size.fromHeight(10.0),
      toSliver: toSliver,
      centerTitle: centerTitle,

      /// 避免底部空白, 页面允许滚动(最末控制)
      hasScrollBody: hasScrollBody,
    );
  }

  ///
  /// 构造 tab 页面:
  ///
  Widget buildTabView({
    required List<Widget> titles, // tab 标题
    required List<Widget> pages, // tab body

    ///
    Widget? drawer,
    Widget? leading,
    List<Widget>? actions, // tab actions

    /// 控制 bar 标题位置: 是否避开系统状态栏
    bool? primary,
    Size? preferredSize, // 高度压缩
    bool toSliver = false,
    bool? centerTitle,

    /// 避免底部空白, 页面允许滚动(最末控制)
    bool hasScrollBody = true,
  }) {
    var v = page.tabView(
      tabTitles: titles,
      tabPages: pages,

      centerTitle: centerTitle,

      ///
      drawer: drawer,
      leading: leading,
      actions: actions,

      /// 控制 bar 标题位置: 是否避开系统状态栏
      primary: primary,
      preferredSize: preferredSize,
    );

    return toSliver ? SliverFillRemaining(child: v, hasScrollBody: hasScrollBody) : v;
  }

  ///
  /// 可滑动折叠页面:
  ///   - 默认不传参数, 会生成一个 demo 效果页面布局
  ///
  Widget buildScrollTabView({
    ScrollController? controller,
    List<Widget>? tabTitles, // 标题组件
    List<Widget>? tabPages, // 页面内容
    Widget? leading, // 头
    VoidCallback? backFn, // 返回附加函数
    List<Widget>? actions, // 尾

    /// flex part:
    Widget? flexTitle, // 折叠标题
    Widget? flexBackground, // 折叠背景(图片)

    ///
    bool isBottomTitle = false,
    bool isSplitSysBar = false, // 是否与系统状态栏切分, 背景图覆盖 // 沉浸式: 合并系统状态栏
    bool isScrollable = true, // 可滑动
    bool pinned = true,
    bool centerTitle = true, // 标题居中
    IconThemeData? iconTheme, // 图标配色
    Color? labelColor, // tab 选中颜色
    Color? unselectedLabelColor, // tab 未选中颜色
    Color? indicatorColor, // 选择器颜色
    Color? backgroundColor, // 背景色
    double? fontSize,
    double? indicatorWeight, // 选择器
    double? expandedHeight, // 头部可折叠部分高度
    double? elevation, // 底线
    Brightness? brightness, // 状态栏
  }) {
    return page.scrollTabView(
      controller: controller,
      tabTitles: tabTitles,
      tabPages: tabPages,
      leading: leading,
      backFn: backFn,
      actions: actions,

      ///
      flexTitle: flexTitle,
      flexBackground: flexBackground,

      ///
      isBottomTitle: isBottomTitle,
      isSplitSysBar: isSplitSysBar,
      isScrollable: isScrollable,
      pinned: pinned,
      centerTitle: centerTitle,
      iconTheme: iconTheme,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      indicatorColor: indicatorColor,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      indicatorWeight: indicatorWeight,
      expandedHeight: expandedHeight,
      elevation: elevation,
      brightness: brightness,
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

  /// 构造 list:
  Widget buildList({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,

    /// convert:
    bool toSliver = false, // 转换成 SliverList()

    /// for listView:
    bool shrinkWrap = true,
    ScrollPhysics? physics, // 嵌套滑动冲突解决
    EdgeInsetsGeometry? padding,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,

    /// for sep:
    bool hasSeparator = true, // 是否分割线
    double? sepIndent, // 有默认0值 !=null, 否则 = null
    double? sepEndIndent, // 有默认0值 !=null, 否则 = null
    double? sepHeight, // 间隔控制, 原默认=16.0(过大)
    Color? sepColor, // 分割线颜色

    /// for container:
    double? width,
    double? height,
    double? radius, // 圆角
    Color? bgColor, // background color
    EdgeInsetsGeometry? bgPadding,
  }) {
    return layout.body.list.build(
      itemCount: itemCount,
      itemBuilder: itemBuilder,

      ///
      toSliver: toSliver,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      scrollDirection: scrollDirection,
      controller: controller,
      hasSeparator: hasSeparator,
      sepIndent: sepIndent,
      sepEndIndent: sepEndIndent,
      sepHeight: sepHeight,
      sepColor: sepColor,
      width: width,
      height: height,
      radius: radius,
      bgPadding: bgPadding,
    );
  }

  /// 构造 SliverList:
  Widget buildSliverList({
    required itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return layout.body.list.buildSliver(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

  /// 构造 grid:
  Widget buildGrid({
    required int itemCount, // 计数
    required IndexedWidgetBuilder itemBuilder, // 构造

    ///
    bool toSliver = false, // 转换成 SliverList()
    int? crossAxisCount = 4, // 单行个数
    double? mainAxisSpacing = 0.0, // 垂直间隔
    double? crossAxisSpacing = 0.0, // 水平间隔
    double? childAspectRatio = 1.5, // 宽高比 默认1, 控制高度
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    bool shrinkWrap = true,
    EdgeInsetsGeometry? padding,
  }) {
    return layout.body.grid.build(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      toSliver: toSliver,
      controller: controller,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      // required: 否则要指定高度
      padding: padding ?? EdgeInsets.all(0),
      // required: 去掉 list 外部的间隙 + fix 滚动冲突
      crossAxisCount: crossAxisCount ?? 4,
      mainAxisSpacing: mainAxisSpacing!,
      crossAxisSpacing: crossAxisSpacing!,
      childAspectRatio: childAspectRatio!,
    );
  }

  /// 构造 SliverGrid:
  Widget buildSliverGrid({
    required int itemCount, // 计数
    required IndexedWidgetBuilder itemBuilder, // 构造

    ///
    int crossAxisCount = 4, // 一行多少个
    double mainAxisSpacing = 0.0, // 垂直间隔
    double crossAxisSpacing = 0.0, // 水平间隔
    double childAspectRatio = 1.5, // 宽高比 默认1, 控制高度, 如果出现溢出, 可以设置 1.2/1.3
  }) {
    return layout.body.grid.buildSliver(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////

  /// wrap hook:
  /// 输入法键盘自动隐藏
  Widget withInputWrap({required child}) {
    return wrap.inputView(child: child);
  }
}
