import 'package:chapter13/dao/rumour_dao.dart';
import 'package:chapter13/model/rumours_model.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/widget/my_refresh_list.dart';
import 'package:chapter13/widget/nav_appbar.dart';
import 'package:chapter13/widget/space.dart';
import 'package:chapter13/widget/state_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/delivery_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';

/**
 * 权威辟谣，支持上拉加载更多
 */
class RumourNewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RumourState();
  }
}

class _RumourState extends State<RumourNewPage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  bool hasMore = true;
  int _pageSize = 10;
  int _page = 1;
  List<RumoursNews> rumorList = List();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(centerTitle: "权威辟谣"), body: _buildBody());
  }

  Widget _buildBody() {
    return EasyRefresh(
        key: _easyRefreshKey,
        firstRefresh: true,
        autoLoad: true,
        onRefresh: _onRefresh,
        loadMore: _onLoadMore,
        limitScroll: !hasMore,
        refreshHeader: MaterialHeader(
          key: _headerKey,
        ),
        refreshFooter: BallPulseFooter(
          key: _footerKey,
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rumorList.map(_buildItem).toList())));
  }

  Widget _buildItem(item) {
    return GestureDetector(
      child: _buildItemView(item),
      onTap: () {
        AppRoute.push(context, Routers.webViewPage,params: {
          'url':'https://vp.fact.qq.com/article?id='+item.id,
          'title':item.title,
        });
      },
    );
  }

  Widget _buildItemView(item){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.red),
                child: Text(
                  '谣\n言',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              Space(),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item?.title,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Space(),
                    Text(
                      item?.desc,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Space(),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  child: Image.network(item?.imgsrc,
                      width: 100, height: 80, fit: BoxFit.fill))
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  //下拉刷新
  Future<Null> _onRefresh() async {
    _page = 1;
    rumorList.clear();
    getRumor(_page);
  }

  //上拉加载更多
  Future<void> _onLoadMore() async {
    _page++;
    getRumor(_page);
  }

  //获取数据
  getRumor(page) async {
    try {
      RumoursModel model = await RumoursDao.getRumour(page);
      if (model.newslist == null || model.newslist.length <= 0) return;
      if (model.newslist.length < _pageSize) {
        hasMore = false;
      } else {
        hasMore = true;
      }
      //刷新状态
      setState(() {
        for (var item in model.newslist) {
          rumorList.add(item);
        }
      });
    } catch (e) {
      setState(() {});
    }
  }
}
