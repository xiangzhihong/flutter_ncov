import 'package:chapter13/dao/home_dao.dart';
import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/page/map/foreign_info.dart';
import 'package:chapter13/page/map/foreign_info_map.dart';
import 'package:chapter13/page/map/global_info_map.dart';
import 'package:chapter13/page/home/home_statistics.dart';
import 'package:chapter13/page/map/tab_foreign_page.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab_domestic_page.dart';
import 'tab_global_page.dart';

/**
 * 疫情地图
 */
class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {

  var _tabs = ["全球疫情", "海外疫情", "国内疫情"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('疫情地图'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: _tabs[0]),
              Tab(text: _tabs[1]),
              Tab(text: _tabs[2]),
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            TabGlobalPage(),
            TabForeignPage(),
            TabDomesticPage(),
          ],
        ));
  }
}
