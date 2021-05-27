import '../../better_ui.dart';

///
/// 数据类型:
///
class BetterListTileEntity {
  // 点击跳转:
  GestureTapCallback onTap;

  // 二选一:
  Widget title;
  String titleText;

  Widget subTitle;
  String subTitleText;

  // icon:
  Widget iconStart;
  String iconStartUrl;

  // icon:
  Widget iconEnd;
  String iconEndUrl;

  //
  BetterListTileEntity({
    this.onTap,
    this.title,
    this.titleText,
    this.subTitle,
    this.subTitleText,
    this.iconStart,
    this.iconStartUrl,
    this.iconEnd,
    this.iconEndUrl,
  });

  @override
  String toString() {
    return 'BetterListTileEntity{onTap: $onTap, title: $title, titleText: $titleText, subTitle: $subTitle, subTitleText: $subTitleText, iconStart: $iconStart, iconStartUrl: $iconStartUrl, iconEnd: $iconEnd, iconEndUrl: $iconEndUrl}';
  }
}
