import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/home_model.dart';

class HomeDao {

  static Future<HomeModel> fetch() async {
    var url=API.baseUrl+API.getStatistics;
    final response = await HttpUtil.getData(url, {});
    if (response!=null ) {
      HomeModel model=HomeModel().fromJson(response);
      return model;
    } else {
      throw Exception('Failed to load home data');
    }
  }
}