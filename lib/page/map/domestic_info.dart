import 'package:chapter13/model/map_areas_model.dart';
import 'package:chapter13/utils/screen_utils.dart';
import 'package:chapter13/widget/expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 *国内疫情信息
 */

class DomesticView extends StatefulWidget {
  List<dynamic> areas;
  DomesticView({Key key, @required this.areas}) : super(key: key) ;

  @override
  State<StatefulWidget> createState() {
    return _DomesticState(areas);
  }
}

class _DomesticState extends  State<DomesticView> with AutomaticKeepAliveClientMixin{

  List<dynamic> areas;
  _DomesticState(this.areas);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            _buildHeaderView(),
            Column(children: areas.map(buildProvince).toList())
          ],
        ));
  }


  Widget buildProvince(item) {
    AreaModel model = item;
    return ExpansionTileView(
      title: Row(
        children: [
          '${model?.provinceName ?? '未知'}',
          '${model?.confirmedCount ?? 0}',
          '${model?.deadCount ?? 0}',
          '${model?.curedCount ?? 0}'
        ].map((item) {
          return Container(
              width: (winWidth(context) - 40) / 5,
              child:Center(
                child: Text(item, style: TextStyle(fontSize:14)),
              )
          );
        }).toList(),
      ),
      children: model.cities.map(_buildCity).toList(),
    );
  }

  Widget _buildCity(item) {
    AreaModelCity model = item;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            '${model?.cityName ?? '未知'}',
            '${model?.confirmedCount ?? 0}',
            '${model?.deadCount ?? 0}',
            '${model?.curedCount ?? 0}'
          ].map((item) {
            return Container(
              padding: EdgeInsets.only(top:5,right: 10.0),
              width: (winWidth(context) - 40) / 5,
              child: Center(
                child: Text(item, style: TextStyle(fontSize: 14)),
              ),
            );
          }).toList(),
        ),
    );
  }

  Widget _buildHeaderView() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 28,
            color: Colors.black12,
            child: Center(
              child: Text(
                '关注地区',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 28,
            color: Color.fromRGBO(238, 230, 231, 1),
            child: Center(
              child: Text(
                '累计',
                style: TextStyle(fontSize: 12, color: Colors.pink),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 28,
            color: Color.fromRGBO(238, 230, 231, 1),
            child: Center(
              child: Text(
                '死亡',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 28,
            color: Color.fromRGBO(232, 246, 246, 1),
            child: Center(
              child: Text(
                '治愈',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 28,
            color: Colors.black12,
            child: Center(
              child: Text(
                '详情',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
