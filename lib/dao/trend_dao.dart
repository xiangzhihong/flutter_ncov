import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/map_domestic_model.dart';
import 'package:chapter13/model/trend_model.dart';

class TrendDao{

  //国外疫情趋势
  static Future<dynamic> getTrendData() async {
    var url = 'http://api.tianapi.com/txapi/ncovabroad/index?key=7b46416e4fa55d53e61df6947acf8737';
    final response = await HttpUtil.getData(url, {});
    if (response != null) {
      TrendModel model = TrendModel().fromJson(response);
      print('TrendDao model: '+model.toString());
      return model;
    } else {
      throw Exception('Failed to load home data');
    }
  }

}