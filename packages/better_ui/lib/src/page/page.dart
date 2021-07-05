import '../../better_ui.dart';

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
class BetterPage {
  /// 占位符:
  final empty = SizedBox();

  /// 标准页面:
  Widget stdView({
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
      appBar: ui.layout.appBar.classic(
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
  Widget scrollView({
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
      ui.layout.appBar.sliverHeader(
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
      ui.buildSliverList(
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
              ui.layout.appBar.sliverHeader(
                expandedHeight: expandedHeight,

                /// 折叠区域高度
                collapsedHeight: collapsedHeight,

                /// 标题:
                title: ui.layout.appBar.tabBar(
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
                  scrollView(titleText: 'title', flexTitle: ui.empty), // 默认嵌套

                  // Scaffold(body: Container(child: Center(child: Text('page1')))),
                  Scaffold(body: Container(child: Center(child: Text('page1')))),
                ],
          ),
        )));
  }

  ///
  /// tab 结构页面:
  ///
  Widget tabView({
    List<Widget>? tabTitles, // tab 标题
    List<Widget>? tabPages, // tab body
    Widget? drawer, // tab start
    Widget? leading, // tab start
    List<Widget>? actions, // tab actions
    bool? centerTitle,
    Widget? bottomNavigationBar,

    /// 控制标题位置: 是否避开系统状态栏
    bool? primary,
    Size? preferredSize, // 高度压缩
  }) {
    return DefaultTabController(
      length: tabTitles?.length ?? 2,

      ///
      child: Scaffold(
        /// 抽屉:
        drawer: drawer,

        ///
        appBar: PreferredSize(
          /// 压缩导航栏高度:
          preferredSize: preferredSize ?? Size.fromHeight(40.0),

          /// 导航栏:
          child: ui.layout.appBar.withTab(
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

            /// 控制 bar 是否避开 系统状态栏
            primary: primary,
          ),
        ),

        /// body:
        body: TabBarView(
          children: tabPages ??
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

  /// backup, 样式:
  TabBar _buildTabBar(tabTitles) {
    return TabBar(
      // isScrollable: true,
//              tabController: tabController,
      labelColor: Get.isDarkMode ? Colors.white : null,
      labelStyle: TextStyle(fontSize: 12),

      unselectedLabelColor: Get.isDarkMode ? Colors.white : ui.color.DARK,
      indicator: BoxDecoration(
        color: Colors.pinkAccent.withAlpha(200),
      ),
      // 指示器长度: 与标签相同
      // indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: const EdgeInsets.all(2),

//              indicatorWeight: 2,
      /// 边框颜色:
      // tab 间隔空间:
      labelPadding: EdgeInsets.only(bottom: 2, top: 2),

      //
      // length: c.tabTitles.length,
      tabs: tabTitles,
    );
  }
}
