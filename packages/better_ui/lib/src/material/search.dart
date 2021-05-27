import '../../better_ui.dart';

///
///
///
class BetterTextField {
  void popSearch() {
    showSearch(
      context: Get.context,
      delegate: SearchBarViewDelegate(),
    );
  }

  ///
  ///
  ///
  Widget search({
    TextEditingController controller,
    ValueChanged<String> onSubmitted,
    String hintText,
    double width,
    double height,
    EdgeInsetsGeometry padding,
  }) {
    return Container(
      width: width ?? Get.width * 0.8,
      height: height ?? 35.0,
      margin: EdgeInsets.all(0),
      padding: padding ?? EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.white38 : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      /// form:
      child: TextField(
        controller: controller,

        /// 提交:
        onSubmitted: onSubmitted,

        /// 搜索标志:
        textInputAction: TextInputAction.search,
        // textAlign: TextAlign.left,
        decoration: InputDecoration(
          // 去除边框
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          border: OutlineInputBorder(borderSide: BorderSide.none),

          /// 前缀图标:
          prefixIcon: Icon(Icons.search),

          /// 后缀图标:
          suffixIcon: InkWell(child: Icon(Icons.close), onTap: () => controller.clear()),

          /// 提示信息:
          hintText: hintText ?? ' Hint Text',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14 // required
              ),
        ),
      ),
    );
  }
}

///
/// 搜索页面:
///
class SearchBarViewDelegate extends SearchDelegate<String> {
  String searchHint = '';
  var sourceList = <String>[];
  var suggestList = <String>[];

  @override
  String get searchFieldLabel => searchHint;

  ///
  ///
  ///
  SearchBarViewDelegate({
    this.searchHint,
    this.sourceList,
    this.suggestList,
  }) : super(
          searchFieldLabel: searchHint,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ) {
    searchHint = searchHint ?? 'input DApp Url...';
    sourceList = sourceList ??
        [
          'dart',
          'dart 入门',
          'flutter',
          'flutter 编程',
          'flutter 编程开发',
        ];

    ///
    /// 建议列表:
    ///
    suggestList = suggestList ??
        [
          'uniswap',
          'counpound',
        ];
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    ///显示在最右边的控件列表
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';

          ///搜索建议的内容
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ];
  }

  ///左侧带动画的控件，一般都是返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),

      ///调用 close 关闭 search 界面
      onPressed: () => close(context, null),
    );
  }

  ///展示搜索结果
  @override
  Widget buildResults(BuildContext context) {
    var result = <String>[];

    ///模拟搜索过程
    for (var str in sourceList) {
      ///query 就是输入框的 TextEditingController
      if (query.isNotEmpty && str.contains(query)) {
        result.add(str);
      }
    }

    ///展示搜索结果
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(result[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggest = query.isEmpty
        ? suggestList
        : sourceList
            .where(
              (input) => input.startsWith(query),
            )
            .toList();

    // return ui.buildList(itemCount: null, itemBuilder: null);

    return Container(
      child: ListView(
        children: [
          Text('搜索历史:'),
          SizedBox(height: 20),

          ///
          ///
          ///
          Text('热门推荐:'),
          ui.buildList(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: suggest.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: suggest[index].substring(0, query.length),
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: suggest[index].substring(query.length),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                //  query.replaceAll("", suggest[index].toString());
                searchHint = '';
                query = suggest[index].toString();
                showResults(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
