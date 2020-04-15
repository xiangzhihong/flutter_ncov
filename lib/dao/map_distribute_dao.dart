
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/find_news_model.dart';
import 'package:chapter13/model/map_distribute_model.dart';

class DistributeDao{

  static Future<dynamic> getDatas() async {
    var url="https://lab.ahusmart.com/nCoV/api/area";
    final response = await HttpUtil.getData(url, {});
    if (response!=null ) {
      MapDistributeModel model=MapDistributeModel().fromJson(response);
      return model;
    } else {
      throw Exception('Failed to load home data');
    }
  }

}