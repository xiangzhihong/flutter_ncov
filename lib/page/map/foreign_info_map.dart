import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 *国外疫情地图
 */

class ForeignMapView extends StatelessWidget {

  final HomeModel model;
  List<String> maps = List();

  ForeignMapView({Key key, @required this.model}) : super(key: key) {
    if (model != null) {
      model.foreignTrendChart.map((item) {
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
      child: Visibility(
        visible: TextUtil.listNoEmpty(maps),
        child: Column(
          children: maps.map((pic) {
            return Image.network(pic, fit: BoxFit.fill);
          }).toList(),
        ),
      ),
    );
  }
}
