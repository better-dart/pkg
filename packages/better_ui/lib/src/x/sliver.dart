import 'package:flutter/material.dart';

/// 自定义 SliverPersistentHeaderDelegate
///
class BetterSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double max; // 最大高度
  final double min; // 最小高度

  /// 需要展示的内容
  final Widget child;

  /// 如果 assert 内部条件不成立，会报错
  BetterSliverPersistentHeaderDelegate({
    @required this.child,
    this.max = 300,
    this.min = 100,
  })  : assert(child != null),
        assert(min <= max),
        super();

  /// 返回展示的内容，如果内容固定可以直接在这定义，如果需要可扩展，这边通过传入值来定义
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  double get maxExtent => max; // 返回最大高度

  @override
  double get minExtent => min; // 返回最小高度

  @override
  bool shouldRebuild(BetterSliverPersistentHeaderDelegate oldDelegate) {
    /// 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.max || min != oldDelegate.min || child != oldDelegate.child;
  }
}
