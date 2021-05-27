import 'package:dio/dio.dart';
import 'package:webfeed/webfeed.dart';

/// RSS Type:
enum RssType {
  undefined,
  rss,
  atom,
}

/// 自动尝试解析 RSS 类型:
Future rssAutoParse(url, {RssType type}) async {
  var resp;
  var feed;

  // http:
  try {
    resp = await Dio().get(url);
  } catch (e) {
    return;
  }

  // parse:
  switch (type) {
    case RssType.rss:
      {
        feed = RssFeed.parse(resp._data);
        break;
      }
    case RssType.atom:
      {
        feed = AtomFeed.parse(resp._data);
        break;
      }

    default:
      {
        try {
          feed = RssFeed.parse(resp._data);
        } on Error {
          feed = AtomFeed.parse(resp._data);
        }
      }
  }

  return feed;
}
