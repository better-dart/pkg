import '../../better_ui.dart';

///
/// button item:
///
class BetterButtonEntity {
  String title;
  Widget icon;
  Color color;
  void Function() OnTap;

  BetterButtonEntity({
    this.title,
    this.icon,
    this.color,
    this.OnTap,
  }); // click
}
