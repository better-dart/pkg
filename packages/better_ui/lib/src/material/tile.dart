import '../../better_ui.dart';

///
///
///
class BetterListTile {
  ///
  ///
  ///
  Widget classic({
    BetterListTileEntity data,
    Color backgroundColor,
    double radius,
    bool dense = false, // 压缩字体大小:
    Color iconColor,
    bool setFont = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 0.0), // required default
      ),
      child: ListTile(
        // 压缩字体大小:
        dense: dense,

        // contentPadding:
        //     EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),

        // click
        onTap: data.onTap,

        //
        title: data.titleText != null
            ? Text(
                data.titleText,
                style: setFont
                    ? TextStyle(
                        fontSize: 12,
                      )
                    : null,
              )
            : data.title,

        //
        subtitle: data.subTitleText != null
            ? Text(
                data.subTitleText,
                style: setFont
                    ? TextStyle(
                        fontSize: 10,
                      )
                    : null,
              )
            : data.subTitle,

        // head:
        leading: data.iconStartUrl != null
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage(data.iconStartUrl),
                  color: iconColor,
                ),
              )
            : data.iconStart,

        // end:
        trailing: data.iconEndUrl != null
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage(data.iconEndUrl),
                  color: iconColor,
                ),
              )
            : data.iconEnd,
      ),
    );
  }

  ///
  /// 下拉选择:
  ///
  Widget select({@required int itemCount, @required IndexedWidgetBuilder itemBuilder, Widget leading, Widget title, Widget subtitle}) {
    return ExpansionTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      // backgroundColor: Get.theme.primaryColor,
      children: [
        ui.buildList(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ],
    );
  }
}
