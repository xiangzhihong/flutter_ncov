import 'dart:async';
import 'dart:convert';

import 'package:chapter13/http/http_util.dart';
import 'package:chapter13/model/seach_model.dart';

//搜索接口
class SearchDao {

  static Future<SearchModel> fetch(String url, String text) async {
    final response = await HttpUtil.getData(url, {});
    if (response.statusCode == 200) {
      SearchModel model = SearchModel.fromJson(response);
      model.keyword = text;
      return model;
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
