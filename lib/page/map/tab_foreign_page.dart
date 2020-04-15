import 'package:chapter13/dao/home_dao.dart';
import 'package:chapter13/dao/trend_dao.dart';
import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/model/trend_model.dart';
import 'package:chapter13/page/map/foreign_trend.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'foreign_info.dart';
import 'foreign_info_map.dart';
import 'global_info.dart';

/**
 * 海外疫情Tab
 */
class TabForeignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabForeignState();
  }
}

class _TabForeignState extends State<TabForeignPage> {
  bool _loading = true;
  HomeModel homeModel;
  TrendModel trendModel;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: RefreshIndicator(
                    onRefresh: _handleRefresh, child: _listView),
              ),
            ],
          )),
    );
  }

  Widget get _listView {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Space(),
          TitleView('海外疫情'),
          ForeignView(model: homeModel),
          TitleView('疫情趋势'),
          ForeignTrendView(model: trendModel),
          TitleView('疫情地图'),
          ForeignMapView(model: homeModel)
        ],
      ),
    );
  }

  //下拉刷新
  Future<Null> _handleRefresh() async {
    try {
      HomeModel home = await HomeDao.fetch();
      TrendModel trend = await TrendDao.getTrendData();
      if(home!=null&& trend!=null){
        setState(() {
          homeModel = home;
          trendModel=trend;
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
    return null;
  }
}
