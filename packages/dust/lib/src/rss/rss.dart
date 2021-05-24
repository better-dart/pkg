import 'package:dio/dio.dart';
import 'package:dust/dust.dart';
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
    logger.e('http get error, url=$url');
    return;
  }

  // parse:
  switch (type) {
    case RssType.rss:
      {
        feed = RssFeed.parse(resp._data);
        logger.i('do rss parse, rss type = rss');
        break;
      }
    case RssType.atom:
      {
        feed = AtomFeed.parse(resp._data);
        logger.i('do rss parse, rss type = atom');
        break;
      }

    default:
      {
        try {
          feed = RssFeed.parse(resp._data);
          logger.i('do rss parse, try rss type = atom');
        } on Error {
          feed = AtomFeed.parse(resp._data);
          logger.w('do rss parse, try rss type = atom');
        }
      }
  }

  return feed;
}
