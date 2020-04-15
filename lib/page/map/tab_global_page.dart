import 'package:chapter13/dao/home_dao.dart';
import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global_info.dart';
import 'global_info_map.dart';

/**
 * 疫情地图
 */
class TabGlobalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabGlobalPageState();
  }
}

class _TabGlobalPageState extends State<TabGlobalPage> {
  bool _loading = true;
  HomeModel homeModel;
//  List<dynamic> areas = List();

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
          TitleView('全球疫情'),
          GlobalInfoView(model: homeModel),
          TitleView('疫情地图'),
          GlobalInfoMapView(model: homeModel),
        ],
      ),
    );
  }

  //下拉刷新
  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        homeModel = model;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
    return null;
  }
}
