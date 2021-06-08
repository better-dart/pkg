import '../../better_ui.dart';

///
///
///
class BetterBody {
  // 列式菜单:
  final list = betterBodyList();

  // 网格菜单:
  final grid = betterBodyGrid();
}

///
/// 列式菜单
///
class betterBodyList {
  ///
  /// 典型用法:
  ///
  Widget classic({
    required List<BetterListTileEntity> items,

    ///
    bool toSliver = false, // 转换成 SliverList()

    ///
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    bool shrinkWrap = true,
    EdgeInsetsGeometry? padding,

    ///
    bool hasSeparator = true, // 是否分割线
    double? sepIndent, // 有默认0值 !=null, 否则 = null
    double? sepEndIndent, // 有默认0值 !=null, 否则 = null
    double? sepHeight, // 间隔控制, 原默认=16.0(过大)
    Color? sepColor,

    /// for container:
    double? width,
    double? height,
    required double radius, // 圆角
    Color? backgroundColor, // background color

    /// for font:
    bool setFont = false,
  }) {
    return build(
      toSliver: toSliver,

      //
      scrollDirection: scrollDirection,
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: padding,

      //
      hasSeparator: hasSeparator,
      sepIndent: sepIndent,
      sepEndIndent: sepEndIndent,
      sepHeight: sepHeight,
      sepColor: sepColor,

      //
      width: width,
      height: height,
      radius: radius,
      bgColor: backgroundColor,

      //
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];

        return ui.material.listTile.classic(
          data: item,
          backgroundColor: sepColor,
          radius: radius,
          setFont: setFont,
        );
      },
    );
  }

  ///
  /// 构建:
  ///
  Widget build({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,

    ///
    bool toSliver = false, // 转换成 SliverList()

    /// for listView:
    bool shrinkWrap = true,
    EdgeInsetsGeometry? padding,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    ScrollPhysics? physics, // 嵌套滑动冲突解决
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
    /// 分割线: ListView.separate()  vs ListView.builder()
    var v = Container(
      width: width,
      height: height,
      padding: bgPadding ?? EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),

      ///
      child: ListView.separated(
        //
        controller: controller,
        scrollDirection: scrollDirection,
        // required: 否则要指定高度
        shrinkWrap: shrinkWrap,
        // required: 去掉 list 外部的间隙 + fix 滚动冲突
        padding: padding ?? EdgeInsets.all(0),
        // 嵌套 list, 滑动冲突解决
        // shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
        // physics:NeverScrollableScrollPhysics(),//禁用滑动事件
        physics: physics,

        // 分割线:
        separatorBuilder: (BuildContext context, int index) => ui.style.divider(
          color: hasSeparator ? sepColor : Colors.transparent,
          height: sepHeight ?? 0.0,
          indent: sepIndent ?? Get.width * 0.18,
          endIndent: sepEndIndent,
        ),
        itemCount: itemCount ,
        // do here:
        itemBuilder: itemBuilder,
      ),
    );

    // 是否转换成 SliverList
    return toSliver ? SliverToBoxAdapter(child: v) : v;
  }

  ///
  /// SliverList vs SliverToBoxAdapter:
  ///   - 实现不同, 上下滑动效果不同
  ///
  Widget buildSliver({
    required itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        itemBuilder,
        childCount: itemCount,
      ),
    );
  }
}

///
/// 网格布局:
///   - 支持普通网格
///   - 支持 SliverGrid
///
class betterBodyGrid {
  ///
  /// 构建普通网格:
  ///
  Widget build({
    /// 计数:
    required int itemCount,

    /// 一行多少个
    int? crossAxisCount,

    /// 构造:
    required IndexedWidgetBuilder itemBuilder,

    /// 垂直间隔
    double mainAxisSpacing = 0.0,

    /// 水平间隔
    double crossAxisSpacing = 0.0,

    /// 宽高比 默认1, 控制高度
    double childAspectRatio = 1.5,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,

    ///
    bool toSliver = false, // 转换成 SliverList()
    ///
    bool shrinkWrap = true,
    EdgeInsetsGeometry? padding,
  }) {
    var v = GridView.builder(
      /// 计数:
      itemCount: itemCount,

      /// 构造:
      itemBuilder: itemBuilder,

      ///
      controller: controller,

      ///
      scrollDirection: scrollDirection,

      /// required: 否则要指定高度
      shrinkWrap: shrinkWrap,

      /// required: 去掉 list 外部的间隙 + fix 滚动冲突
      padding: padding ?? EdgeInsets.all(0),

      /// 默认布局:
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 4,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
    );

    // 是否转换成 SliverList
    return toSliver ? SliverToBoxAdapter(child: v) : v;
  }

  ///
  /// SliverGrid vs SliverToBoxAdapter():
  ///   - 二者实现有差别, 上下滑动, 效果不一样.
  ///   - SliverGrid 更自然. 尽量不使用 SliverToBoxAdapter 方式
  ///
  Widget buildSliver({
    /// 计数:
    required int itemCount,

    /// 构造:
    required IndexedWidgetBuilder itemBuilder,

    /// 一行多少个
    int crossAxisCount = 4,

    /// 垂直间隔
    double mainAxisSpacing = 0.0,

    /// 水平间隔
    double crossAxisSpacing = 0.0,

    /// 宽高比 默认1, 控制高度
    double childAspectRatio = 1.5,
  }) {
    return SliverGrid(
      /// 元素构建:
      delegate: SliverChildBuilderDelegate(
        /// 构建:
        itemBuilder,

        /// 计数:
        childCount: itemCount,
      ),

      /// 基础网格布局样式:
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
    );
  }
}
