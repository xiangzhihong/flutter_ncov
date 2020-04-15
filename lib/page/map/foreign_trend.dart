import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/model/trend_model.dart';
import 'package:chapter13/utils/date_utils.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/**
 * 国外疫情趋势统计
 */

class ForeignTrendView extends StatelessWidget {
  final TrendModel model;
  List<TrendData> trends = new List();

  ForeignTrendView({Key key, @required this.model}) : super(key: key) {
    //截取前5个数据
    TrendData data = null;
    for (int i = 0; i < 8; i++) {
      data = new TrendData(model.newslist[i].countryShortCode,
          model.newslist[i].currentConfirmedCount);
      trends.add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<TrendData, String>>[
                LineSeries<TrendData, String>(
                    dataSource: trends,
                    xValueMapper: (TrendData sales, _) => sales.xValue,
                    yValueMapper: (TrendData sales, _) => sales.yValue)
              ]),
        ));
  }
}

class TrendData {
  final String xValue;
  final int yValue;

  TrendData(this.xValue, this.yValue);
}
