import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routers{
  static String root = '/';
  static String detailsPage = './detail';
  static String searchPage = './search';   //搜索
  static String webViewPage = './webview';
  static String rideQueryPage = './ridequery';  //同行程查询
  static String cityPage = './cityPage';  //同行程查询
  static String rumourPage = './rumour';        //权威辟谣
  static String browsePage = './browse';        //大图浏览

  static void configureRouters(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print('错误路由');
      }
    );

    //注册路由页面
    router.define(detailsPage,handler: detailsHandler);
    router.define(searchPage,handler: searchHandler);
    router.define(webViewPage,handler: webViewHandler);
    router.define(rideQueryPage,handler: rideHandler);
    router.define(rumourPage,handler: rumourHandler);
    router.define(browsePage,handler: browseHandler);
    router.define(cityPage,handler: cityHandler);
  }
}