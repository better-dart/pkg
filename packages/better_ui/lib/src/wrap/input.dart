import '../index.dart';

typedef Widget WrapFunc({required Widget child});

///
/// 含输入组件的页面:
///   - 自动隐藏键盘输入法
///
Widget useInputWrap({required Widget child}) {
  return GestureDetector(
    /// 键盘隐藏
    onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    onPanDown: (details) => SystemChannels.textInput.invokeMethod('TextInput.hide'),

    /// body:
    child: child,
  );
}
