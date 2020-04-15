import 'dart:convert';

import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/page/browse/browse_page.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/fade_router.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 全球疫情地图
 */
class GlobalInfoMapView extends StatelessWidget {

  final HomeModel model;
  List<String> maps = List();

  GlobalInfoMapView({Key key, @required this.model}) : super(key: key) {
    if (model != null) {
      model.importantForeignTrendChart.map((item) {
        if (item.imgUrl != null) {
          maps.add(item.imgUrl);
        }
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Image.network(
            model.imgUrl,
            fit: BoxFit.fill,
          ),
          Visibility(
            visible: TextUtil.listNoEmpty(model?.importantForeignTrendChart),
            child: Column(
              children: maps.map((pic) {
                return GestureDetector(
                  child: Image.network(pic, fit: BoxFit.fill),
                  onTap: (){
                    AppRoute.push(context, Routers.browsePage,params: {
                      'images':json.encode(maps),
                      'index':'0',
                    });
                    Navigator.of(context).push(FadeRoute(page: BrowsePage(
                      images:maps,
                      index: 0,
                    )));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
