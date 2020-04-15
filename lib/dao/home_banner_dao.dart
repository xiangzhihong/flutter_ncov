import 'package:chapter13/model/home_banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class HomeBannerDao {

  static Future<HomeBannerModel> fetch(context) async {
    Future<String> banners =
        DefaultAssetBundle.of(context).loadString("mock/home_banner.json");
    print('HomeBannerDao fetch: ' + banners.toString());
    banners.then((String value){
      var data=json.decode(value);
      HomeBannerModel model = new HomeBannerModel().fromJson(data);
      return model;
    });
    return null;
  }

}
