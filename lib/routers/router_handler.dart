import 'dart:convert';

import 'package:chapter13/page/browse/browse_page.dart';
import 'package:chapter13/page/city/city_select_page.dart';
import 'package:chapter13/page/home/rumour_page.dart';
import 'package:chapter13/page/search/search_page.dart';
import 'package:chapter13/page/travel/ride_query_page.dart';
import 'package:chapter13/widget/webview.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

Handler detailsHandler = Handler(
//  handlerFunc: (BuildContext context,Map<String,List<String>> params){
//    String goodsId = params['id'].first;
//    print('参数');
//    print(goodsId);
//    return DetailsPage(goodsId);
//  }
    );

//权威辟谣
Handler rumourHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return RumourPage();
    });

//搜索
Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SearchPage();
});

//同行程查询
Handler rideHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return RideQueryPage();
});

//选择城市
Handler cityHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return CitySelectPage();
    });

//大图浏览
Handler browseHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      List<String> images = json.decode(params['images'][0]).cast<String>();
      int index = int.parse(params['index'][0]);
      return BrowsePage(
          images:images,
          index:index
      );
    });

//网页
var webViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params['url'][0];
  String title = params['title'][0];
  return WebViewPage(
    url: url,
    title: title,
  );
});
