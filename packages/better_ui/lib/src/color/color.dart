import '../../better_ui.dart';

///
///
///
class BetterColor {
  //
  Color? iconBlue() {
    return Colors.blue[200];
  }

  //
  Color? buttonBlue() {
    return Colors.blue[200];
  }

  //
  Color? barBlue() {
    return Colors.blue[200];
  }

  Color white() {
    return Colors.white70;
  }

  /// color table:
  Color PRIMARY = Color(0xff3880FF);
  Color SECONDARY = Color(0xffAA66CC);
  Color SUCCESS = Color(0xff10DC60);
  Color INFO = Color(0xff33B5E5);
  Color WARNING = Color(0xffFFBB33);
  Color DANGER = Color(0xffF04141);
  Color LIGHT = Color(0xffE0E0E0);
  Color DARK = Color(0xff222428);
  Color WHITE = Color(0xffffffff);
  Color FOCUS = Color(0xff434054);
  Color ALT = Color(0xff794c8a);
  Color TRANSPARENT = Colors.transparent;

  /// card 背景色:
  Color cardBgBlue = Colors.blue.withAlpha(300);
  Color cardBgYellow = Colors.orangeAccent;

  /// 按钮背景色:
  Color btnBgGrey = Color(0xff434054).withAlpha(200);
}
