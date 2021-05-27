import '../../better_ui.dart';

///
/// 404 page:
///
Widget useNotFoundView({String titleText}) {
  var pagePath = Get.routing?.current;

  return Scaffold(
    appBar: ui.layout.appBar.classic(titleText: titleText ?? 'Not Found'),
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
