
import 'package:chapter13/config/api.dart';
import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/home_rumour_model.dart';

class RumourDao{

  static Future<dynamic> getRumor() async {
    var url=API.baseUrl+API.getIndexRumorList;
    final response = await HttpUtil.getData(url, {});
    List list = List();
    if (response!=null){
      response.forEach((json) => list.add(HomeRumourModel.fromJson(json)));
    }
    print('RumourDao list: '+list.toString());
    return Future.value(list);
  }

}