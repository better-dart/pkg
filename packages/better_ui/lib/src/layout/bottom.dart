import 'package:flutter/cupertino.dart';

import '../../better_ui.dart';

///
///
///
class BetterBottom {
  ///
  Widget classicListView() {
    return Container();
  }

  ///
  /// 居中:
  ///
  Widget classic({String title, void Function() backFn}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          /// before back
          backFn();

          Get.back();
        },
      ),
    );
  }

  ///

}
