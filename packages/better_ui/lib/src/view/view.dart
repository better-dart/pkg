import '../../better_ui.dart';

class BetterPage with ViewMixin {}

mixin ViewMixin {
  ///
  /// 自定义布局:
  ///
  /// CustomScrollView() 和 NestedScrollView() 使用对比.
  ///   - 在嵌套 Listview() 使用上, 有差别.
  ///   - 不使用 SliverAppBar() 场景, 推荐用 NestedScrollView(), 写法简单.
  ///   - 否则, 使用 CustomScrollView(), 不然有些效果, 不正常.
  ///
  /// ref:
  ///   - https://juejin.cn/post/6844904199981891592
  ///   - https://juejin.cn/post/6861798947208953863
  ///   - https://juejin.cn/post/6844903713887240206
  ///     - 滚动冲突解决
  ///     - https://github.com/tristanzeng/tristanzeng.github.io/issues/16
  ///
  /// 标准页面:
  Widget buildStdView({
    Size? preferredSize, // 压缩高度 // Size.fromHeight(34.0)
    Widget? title,
    String? titleText,
    bool centerTitle = true,
    bool resizeToAvoidBottomInset = false,
    Color? backgroundColor,
    VoidCallback? backFn, // 返回附加函数
    Widget? leading,
    List<Widget>? actions,

    ///
    required Widget body,
    Widget? bottomNavigationBar,
  }) {
    return Scaffold(
      /// header:
      appBar: ui.appBar.classic(
        preferredSize: preferredSize,
        title: title,
        titleText: titleText,
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        backFn: backFn,
        leading: leading,
        actions: actions,
      ) as PreferredSizeWidget?,

      /// content:
      body: body,

      /// footer:
      bottomNavigationBar: bottomNavigationBar,

      /// 输入框问题:
      resizeToAvoidBottomInset: resizeToAvoidBottomInset, //输入框抵住键盘 内容不随键盘滚动
    );
  }

  ///
  /// 滑动页面:
  ///   - 默认不传参数, 会绘制一个默认效果页面
  ///   - 支持组件嵌套
  ///   - 非常灵活控制页面布局
  ///   - https://juejin.cn/post/6844903821328515079
  ///
  ///
  Widget buildScrollView({
    ScrollController? controller,
    String titleText = '', // 标题文本
    Widget? title, // 标题组件
    Widget? leading, // 头
    VoidCallback? backFn, // 返回附加函数
    List<Widget>? actions, // 尾
    ///
    List<Widget>? bodySlivers, // 二选一: [bodySlivers, body] 常用: 内容布局集
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
    Color? barBackgroundColor, // appBar 背景色
    Color? pageBackgroundColor, // page 背景色
    Brightness? brightness, // 状态栏
    double? expandedHeight, // 头部可折叠部分高度
    double? collapsedHeight, // 折叠区域高度
    double? elevation, // 底线
  }) {
    /// page body:
    var contents = <Widget>[];

    /// add page header:
    contents.addIf(
      hasAppBar == true && hasHeader == true,
      ui.appBar.newSliverAppBar(
        titleText: titleText,
        title: title,
        leading: leading,
        backFn: backFn,
        actions: actions,
        flexTitle: flexTitle,

        /// 折叠区域
        flexibleSpace: flexibleSpace,
        flexBackground: flexBackground,
        pinned: pinned,
        isBottomTitle: isBottomTitle,
        isSplitSysBar: isSplitSysBar,
        centerTitle: centerTitle,
        iconTheme: iconTheme,
        backgroundColor: barBackgroundColor,
        brightness: brightness,
        expandedHeight: expandedHeight,

        /// 折叠区域高度
        collapsedHeight: collapsedHeight,
        elevation: elevation,
      ),
    );

    /// add page contents:
    contents.addAllIf(bodySlivers != null, bodySlivers!);

    /// add nested page:
    contents.addIf(body != null, SliverFillRemaining(child: body));

    /// add demo sliver grid+list:
    contents.addAllIf(body == null && bodySlivers == null, [
      ui.buildSliverGrid(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () => Get.defaultDialog(title: 'Hello, friend', content: Text('test message')),
                child: Center(
                  child: Text('grid'),
                ),
              ),
            );
          }),
      ui.newSliverList(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('list item'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Get.defaultDialog(title: 'Hello, friend', content: Text('test message')),
              ),
            );
          }),
    ]);

    /// fix: required, fix scroll+pinned
    ///   - 必须填充一个, 否则会出现无法滚动问题. WTF
    ///   - 最后填充用: 会占有一个屏幕的高度
    ///   - hasScrollBody: false, 控制无法下拉, 避免白屏窗口
    contents.add(SliverFillRemaining(child: ui.empty, hasScrollBody: hasScrollBody));

    /// 是否去除 appbar
    return hasAppBar
        ? Scaffold(
            /// 页面 page 整体背景色: // Colors.white30
            backgroundColor: pageBackgroundColor ?? (Get.isDarkMode ? null : Colors.white),

            /// 输入框问题:
            resizeToAvoidBottomInset: false, //输入框抵住键盘 内容不随键盘滚动

            /// 清除默认 bar: 下面基于 SliverAppBar 定制
            appBar: isSplitSysBar
                ? PreferredSize(
                    /// 清除默认:
                    preferredSize: Size.fromHeight(0),
                    child: AppBar(
                      /// 设置背景为全白色:
                      backgroundColor: barBackgroundColor ?? (Get.isDarkMode ? null : Colors.white),

                      /// 控制系统状态栏字体颜色:
                      brightness: brightness ?? (Get.isDarkMode ? Brightness.dark : Brightness.light),

                      /// AppBar 底部下划线-隐藏阴影
                      elevation: elevation ?? 0.0,
                    ),
                  )
                : null,

            /// 滑动吸顶折叠:
            body: CustomScrollView(
              controller: controller ?? ScrollController(),

              /// page contents:
              /// 支持灵活嵌套: sliver 组件
              ///
              slivers: contents,
            ),
          )
        : CustomScrollView(
            controller: controller ?? ScrollController(),

            /// page contents:
            /// 支持灵活嵌套: sliver 组件
            ///
            slivers: contents,
          );
  }

  ///
  /// 可滚动 tab 页面:
  ///
  Widget scrollTabView({
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
    double? collapsedHeight, // 折叠区域高度
    double? elevation, // 底线
    Brightness? brightness, // 状态栏
  }) {
    assert(tabTitles?.length == tabPages?.length);

    return DefaultTabController(
        length: tabTitles?.length ?? 2,

        ///
        child: Material(
            child: NestedScrollView(
          ///
          /// header:
          ///
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              ui.appBar.newSliverAppBar(
                expandedHeight: expandedHeight,

                /// 折叠区域高度
                collapsedHeight: collapsedHeight,

                /// 标题:
                title: ui.appBar.newTabBar(
                  titles: tabTitles ??
                      [
                        Tab(text: 'tab1'),
                        Tab(text: 'tab2'),
                      ],
                  actions: actions,
                  backFn: backFn,
                  centerTitle: centerTitle,
                  isScrollable: isScrollable,
                  fontSize: fontSize,
                  indicatorWeight: indicatorWeight,
                  indicatorColor: indicatorColor,
                  labelColor: labelColor,
                  unselectedLabelColor: unselectedLabelColor,
                  backgroundColor: backgroundColor,
                ),

                leading: leading,
                actions: actions,
                backFn: backFn,

                ///
                isBottomTitle: isBottomTitle,
                pinned: pinned,

                /// 滚动部分:
                flexTitle: flexTitle ?? ui.empty,
                flexBackground: flexBackground,
              ),

              //
            ];
          },

          ///
          /// tab pages:
          ///
          body: TabBarView(
            children: tabPages ??
                [
                  buildScrollView(titleText: 'title', flexTitle: ui.empty),
                  // 默认嵌套

                  // Scaffold(body: Container(child: Center(child: Text('page1')))),
                  Scaffold(body: Container(child: Center(child: Text('page1')))),
                ],
          ),
        )));
  }

  ///
  /// tab 结构页面:
  ///
  Widget newTabView({
    List<Widget>? tabs, // tab 标题
    List<Widget>? views, // tab body

    /// tab part:
    Widget? drawer, // tab start
    Widget? endDrawer, // tab start
    Widget? leading, // tab start
    List<Widget>? actions, // tab actions
    bool? centerTitle,
    Widget? bottomNavigationBar,

    /// 控制标题位置: 是否避开系统状态栏
    bool? primary,
    Size? preferredSize, // 高度压缩
    Color? backgroundColor,
  }) {
    /// check:
    assert(tabs?.length == views?.length);

    return DefaultTabController(
      length: tabs?.length ?? 2,

      ///
      child: Scaffold(
        /// 抽屉:
        drawer: drawer,
        endDrawer: endDrawer,

        ///
        appBar: PreferredSize(
          /// 压缩导航栏高度:
          preferredSize: preferredSize ?? Size.fromHeight(40.0),

          /// 导航栏:
          child: ui.appBar.withTab(
            backgroundColor: backgroundColor,

            leading: leading,
            centerTitle: centerTitle ?? true,
            titles: tabs ??
                [
                  Text('tab1'),
                  Text('tab2'),
                ],
            actions: actions ??
                [
                  Icon(Icons.search),
                ],

            /// 控制 bar 是否避开 系统状态栏
            primary: primary,
          ),
        ),

        /// body:
        body: TabBarView(
          children: views ??
              [
                Container(child: Center(child: Text('New Page1'))),
                Container(child: Center(child: Text('New Page2'))),
              ],
        ),

        /// bottom:
        bottomNavigationBar: bottomNavigationBar,

        /// 输入框问题:
        resizeToAvoidBottomInset: false, //输入框抵住键盘 内容不随键盘滚动
      ),
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
    Widget? bottomNavigationBar,

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
      bottomNavigationBar: bottomNavigationBar,

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
    Widget? endDrawer,
    Widget? leading,
    List<Widget>? actions, // tab actions

    /// 控制 bar 标题位置: 是否避开系统状态栏
    bool? primary,
    Size? preferredSize, // 高度压缩
    Color? backgroundColor,
    bool toSliver = false,
    bool? centerTitle,
    Widget? bottomNavigationBar,

    /// 避免底部空白, 页面允许滚动(最末控制)
    bool hasScrollBody = true,
  }) {
    var v = newTabView(
      tabs: titles,
      views: pages,

      centerTitle: centerTitle,

      ///
      drawer: drawer,
      endDrawer: endDrawer,
      leading: leading,
      actions: actions,

      bottomNavigationBar: bottomNavigationBar,

      /// 控制 bar 标题位置: 是否避开系统状态栏
      primary: primary,
      preferredSize: preferredSize,
      backgroundColor: backgroundColor,
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
    return scrollTabView(
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

  /////////////////////////////////////////////////////////////////////////////////////////////////

  Widget buildTabView2({
    required List<Widget> titles,
    required List<Widget> pages,
    TabController? controller,
    Widget? drawer,
    Widget? leading,
    List<Widget>? actions,
    bool? primary,
    Size? preferredSize,
    bool toSliver = false,
    bool? centerTitle,
    Widget? bottomNavigationBar,
    bool hasScrollBody = true,
  }) {
    var v = tabView2(
      controller: controller,
      tabTitles: titles,
      tabPages: pages,
      centerTitle: centerTitle,
      drawer: drawer,
      leading: leading,
      actions: actions,
      bottomNavigationBar: bottomNavigationBar,
      primary: primary,
      preferredSize: preferredSize,
    );

    return toSliver ? SliverFillRemaining(child: v, hasScrollBody: hasScrollBody) : v;
  }

  Widget tabBar({
    required List<Widget> titles,
    TabController? controller,
    List<Widget>? actions,
    VoidCallback? backFn,
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
      tabs: titles,
      controller: controller,
      isScrollable: isScrollable ?? true,
      labelStyle: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.bold,
      ),
      labelColor: labelColor ?? (Get.isDarkMode ? null : Get.theme.primaryColor),
      unselectedLabelColor: unselectedLabelColor ?? Get.theme.unselectedWidgetColor,
      indicatorColor: indicatorColor ?? Get.theme.primaryColor,
      indicatorWeight: indicatorWeight ?? 3.0,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
    );
  }

  Widget buildTabAppBar({
    required List<Widget> titles,
    TabController? controller,
    VoidCallback? backFn,
    Widget? leading,
    List<Widget>? actions,
    bool centerTitle = true,
    bool? primary,
    double? fontSize,
    double? indicatorWeight,
    Color? backgroundColor,
    Color? indicatorColor,
    Color? labelColor,
    Color? unselectedLabelColor,
    Size? preferredSize,
  }) {
    return ui.appBar.newAppBar(
      preferredSize: preferredSize,
      primary: primary,
      title: tabBar(
        titles: titles,
        controller: controller,
        actions: actions,
        backFn: backFn,
        centerTitle: centerTitle,
        fontSize: fontSize,
        indicatorWeight: indicatorWeight,
        indicatorColor: indicatorColor,
        unselectedLabelColor: unselectedLabelColor,
        labelColor: labelColor,
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      backFn: backFn,
      leading: leading,
      actions: actions,
      bottom: null,
    );
  }

  Widget tabView2({
    TabController? controller,
    List<Widget>? tabTitles,
    List<Widget>? tabPages,
    Widget? drawer,
    Widget? leading,
    List<Widget>? actions,
    bool? centerTitle,
    Widget? bottomNavigationBar,
    bool? primary,
    Size? preferredSize,
  }) {
    return DefaultTabController(
      length: tabTitles?.length ?? 2,
      child: Scaffold(
        drawer: drawer,
        appBar: PreferredSize(
          preferredSize: preferredSize ?? Size.fromHeight(40.0),
          child: buildTabAppBar(
            controller: controller,
            leading: leading,
            centerTitle: centerTitle ?? true,
            titles: tabTitles ??
                [
                  Text('tab1'),
                  Text('tab2'),
                ],
            actions: actions ??
                [
                  Icon(Icons.search),
                ],
            primary: primary,
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: tabPages ??
              [
                Container(child: Center(child: Text('New Page1'))),
                Container(child: Center(child: Text('New Page2'))),
              ],
        ),
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
