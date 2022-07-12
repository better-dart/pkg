import '../../better_ui.dart';

///
/// 404 page:
///
Widget useNotFoundView({String? titleText}) {
  var pagePath = Get.routing.current;

  return Scaffold(
    appBar: ui.appBar.classic(titleText: titleText ?? 'Not Found') as PreferredSizeWidget?,
    backgroundColor: Get.isDarkMode ? null : Colors.white,
    body: ui.style.box(
      child: Center(
        child: Text(
          'ERROR 404 \npage not found $pagePath',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    ),
  );
}
