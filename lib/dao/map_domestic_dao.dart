import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/map_domestic_model.dart';

class DomesticDao{

  //国内疫情信息
  static Future<dynamic> getDomesticData() async {
    var url = 'http://api.tianapi.com/txapi/ncovcity/index?key=7cfb4a16bb628d90a4043a707cbfca2f';
    final response = await HttpUtil.getData(url, {});
    if (response != null) {
      MapDomesticModel model = MapDomesticModel().fromJson(response);
      print('DomesticDao model: '+model.toString());
      return model;
    } else {
      throw Exception('Failed to load home data');
    }
  }

}