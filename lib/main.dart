import 'dart:io';

import 'package:chapter13/page/index_page.dart';
import 'package:chapter13/routers/application.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initRouter();
    return Container(
      child: MaterialApp(
        title: '肺炎疫情',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.red),
        home: IndexPage(),
      ),
    );
    _initOverlayStyle();
  }


  //初始化路由
  void initRouter() {
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;
  }

  void _initOverlayStyle() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

}
