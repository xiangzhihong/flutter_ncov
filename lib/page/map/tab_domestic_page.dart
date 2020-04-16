import 'dart:convert';

import 'package:chapter13/dao/home_dao.dart';
import 'package:chapter13/dao/map_area_dao.dart';
import 'package:chapter13/dao/map_distribute_dao.dart';
import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/model/map_distribute_model.dart';
import 'package:chapter13/page/map/domestic_info.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

import 'domestic_info_map.dart';
import 'domestic_map_distribute.dart';
import 'statistics_info.dart';

/**
 * 国内疫情统计
 */
class TabDomesticPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapTabDomesticState();
  }
}

class _MapTabDomesticState extends State<TabDomesticPage> {
  bool _loading = true;
  HomeModel homeModel=null;
  List<MapDistribute> listDistribute=null;
  List<dynamic> areas = List();

  var _futureBuilder;

  @override
  void initState() {
    _futureBuilder=_handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
         future: _futureBuilder,
         builder: (BuildContext context, AsyncSnapshot snapShot) {
           return LoadingContainer(
               isLoading: _loading,
               child: Stack(
                 children: <Widget>[
                   MediaQuery.removePadding(
                     removeTop: true,
                     context: context,
                     child: RefreshIndicator(
                         onRefresh: _handleRefresh,
                         child: NotificationListener(
                           child: _listView,
                         )),
                   ),
                 ],
               ));
         },
      ),
    );
  }

  Widget get _listView {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Space(),
          TitleView('全国疫情'),
          DomesticInfoView(model: homeModel),
          TitleView('疫情地图'),
          MapDistributeWidget(lists:listDistribute),
          TitleView('疫情趋势'),
          DomesticMapView(model: homeModel),
          TitleView(
            '地区统计',
            subTitle: '更多>',
            onTap: () {
              _jumpToWebView();
            },
          ),
          buildTitle(),
          DomesticView(areas: areas)
        ],
      ),
    );
  }

  //打开详情
  _jumpToWebView() {
    String province = "湖北";
    province = PinyinHelper.getPinyinE(province,
        separator: "", format: PinyinFormat.WITHOUT_TONE);
    String url='https://news.sina.cn/project/fy2020/yq_province.shtml?province=' + province;
    AppRoute.push(context, Routers.webViewPage, params: {
      'title': "实时疫情",
      'url': url,
    });
  }

  //下拉刷新,串行请求
  Future<Null> _handleRefresh() async {
    try {
       HomeDao.fetch().then((home){
         HomeModel model=home;

         DistributeDao.getDatas().then((dis){
           MapDistributeModel distribute=dis;
           print('_handleRefresh dis: '+distribute.results.toString());
           AreaDao.getAreaData().then((area) {
             if(model!=null && distribute!=null){
               setState(() {
                 areas = area;
                 homeModel = model;
                 listDistribute=distribute.results;
                 _loading = false;
               });
             }
           });
         });
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  Widget buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Text(
        "数据来自官方通报 全国与各省通报数据可能存在差异:",
        style: TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
