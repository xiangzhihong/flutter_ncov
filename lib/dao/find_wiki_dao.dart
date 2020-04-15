
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/find_wiki_model.dart';
import 'package:chapter13/model/home_rumour_model.dart';

class WikiDao{

  static Future<dynamic> getWiki() async {
    var url=API.baseUrl+API.getWikiList;
    final response = await HttpUtil.getData(url, {});
    if (response!=null ) {
      FindWikiModel model=FindWikiModel().fromJson(response);
      return model;
    } else {
      throw Exception('Failed to load home data');
    }
  }

}