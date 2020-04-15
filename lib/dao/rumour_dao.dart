
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/find_news_model.dart';
import 'package:chapter13/model/rumours_model.dart';

class RumoursDao{

  //权威辟谣
  static Future<RumoursModel> getRumour(page) async {
    var url='http://api.tianapi.com/txapi/rumour/index?key=7cfb4a16bb628d90a4043a707cbfca2f&&page='+page.toString();
    final response = await HttpUtil.getData(url, {});
    if (response!=null ) {
      RumoursModel model=RumoursModel().fromJson(response);
      return model;
    } else {
      throw Exception('Failed to load rumour data');
    }
  }

}