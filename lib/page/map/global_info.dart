import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/utils/date_utils.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 全球疫情统计
 */

class GlobalInfoView extends StatelessWidget {
  final HomeModel model;
  const GlobalInfoView({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List statistics = [
      {
        'label': '累计确诊',
        'value': '${model.globalStatistics?.confirmedCount ?? 0}',
        'yday': '${model.globalStatistics?.confirmedIncr ?? 0}'
      },
      {
        'label': '现存确诊',
        'value': '${model.globalStatistics?.currentConfirmedCount ?? 0}',
        'yday': '${model.globalStatistics?.currentConfirmedIncr ?? 0}'
      },
      {
        'label': '治愈人数',
        'value': '${model.globalStatistics?.curedCount ?? 0}',
        'yday': '${model.globalStatistics?.curedIncr ?? 0}'
      },
      {
        'label': '死亡人数',
        'value': '${model.globalStatistics?.deadCount ?? 0}',
        'yday': '${model.globalStatistics?.deadIncr ?? 0}'
      },
    ];

    Widget itemBuild(item) {
      InfoModel model = InfoModel(item);
      return Column(
        children: <Widget>[
          Text(
            '${model.value}',
            style: TextStyle(
              fontSize: 18.0,
              color: strColor(model.label),
            ),
          ),
          Space(
            height: 5,
          ),
          Text(
            '${model.label}',
            style: TextStyle(fontSize: 13.0),
          ),
          Space(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '昨日',
                style: TextStyle(fontSize: 11.0),
              ),
              Text(
                '${model.yday.contains('-')?model.yday:'+'+model.yday}',
                style: TextStyle(fontSize: 11.0, color: Colors.red),
              ),
            ],
          )
        ],
      );
    }

    return Container(
        padding: EdgeInsets.only(left: 15.0,right: 15,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '更新时间 ${DateUtils.formatTime(model?.modifyTime ?? 0)}',
              style: TextStyle(fontSize: 12.0),
              textAlign: TextAlign.left,
            ),
            Container(
//              padding: EdgeInsets.only(left: 15, right: 15),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10),
                children: statistics.map(itemBuild).toList(),
              ),
            )

          ],
        ));
  }
}

Color strColor(name) {
  switch (name) {
    case '累计确诊':
      return Colors.pink;
      break;
    case '现存确诊':
      return Colors.red;
      break;
    case '治愈人数':
      return Colors.green;
      break;
    case '死亡人数':
      return Colors.grey;
      break;
  }
  return Colors.black;
}

class InfoModel {
  String label;
  String value;
  String yday;

  InfoModel(Map value) {
    this.label = value['label'];
    this.value = value['value'];
    this.yday = value['yday'];
  }
}
