import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 *国内疫情地图
 */

class DomesticMapView extends StatelessWidget {

  final HomeModel model;

  DomesticMapView({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Visibility(
        visible: TextUtil.listNoEmpty(model.dailyPics),
        child: Column(
          children: model.dailyPics.map((pic) {
            return Image.network(pic, fit: BoxFit.fill);
          }).toList(),
        ),
      ),
    );
  }
}
