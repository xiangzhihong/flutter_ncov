
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/home_rumour_model.dart';
import 'package:chapter13/model/map_areas_model.dart';

class AreaDao{

  //疫情地区信息
  static Future<dynamic> getAreaData() async {
    var url=API.baseUrl+API.getAreaStat;
    final response = await HttpUtil.getData(url, {});
    List list = List();
    if (response!=null) {
      response.forEach((json) => list.add(AreaModel.fromJson(json)));
    }
    return Future.value(list);
  }

}