
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/find_news_model.dart';
import 'package:chapter13/model/find_protect_model.dart';
import 'package:chapter13/model/find_wiki_model.dart';
import 'package:chapter13/model/home_rumour_model.dart';

class ProtectDao{

  //防护知识
  static Future<dynamic> getProtects() async {
    var url=API.baseUrl+API.getProtectList;
    final response = await HttpUtil.getData(url, {});
    List list = List();
    if (response!=null){
      response.forEach((json) => list.add(ProtectModel.fromJson(json)));
    }
    print('Protect list: '+list.toString());
    return Future.value(list);
  }

}