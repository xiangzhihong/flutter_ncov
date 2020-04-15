
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/find_news_model.dart';

class NewsDao{

  //新闻
  static Future<dynamic> getNews() async {
    var url=API.baseUrl+API.timelineService;
    final response = await HttpUtil.getData(url, {});
    List list = List();
    if (response!=null){
      response.forEach((json) => list.add(NewsModel.fromJson(json)));
    }
    print('NewsDao list: '+list.toString());
    return Future.value(list);
  }

}