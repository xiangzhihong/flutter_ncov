import 'package:chapter13/dao/home_dao.dart';
import 'package:chapter13/dao/home_rumour_dao.dart';
import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/page/home/home_banner.dart';
import 'package:chapter13/res/strings.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/search_bar.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_guide.dart';
import 'home_marquee.dart';
import 'home_rumour.dart';
import 'home_statistics.dart';

/**
 * 首页
 */

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '查询疫情新闻和最新消息';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double appBarAlpha = 0;
  bool _loading = true;
  HomeModel homeModel ;
  List<dynamic> rumours = List();
  var currCity='上海市';

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
                    onRefresh: _handleRefresh,
                    child: NotificationListener(
                      // ignore: missing_return
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification &&
                            scrollNotification.depth == 0) {
                          //滚动且是列表滚动的时候
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                      },
                      child: _listView,
                    )),
              ),
              _appBar
            ],
          )),
    );
  }

  Widget get _listView {
    List<ItemViewModel> banners=Strings.bannerList;
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          HomeBannerView(banners),
          HomeGuideView(),
          TitleView('全国疫情'),
          HomeStatisticsView(model: homeModel),
          HomeMarqueeView(model: homeModel),
          Space(height: 15),
          Space(height: 5),
          TitleView('最新辟谣',subTitle: '更多>',onTap: (){
            AppRoute.push(context, Routers.rumourPage);
          },),
          HomeRumourView(rumours:rumours),
        ],
      ),
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              leftText: currCity,
              inputBoxClick: _jumpToSearch,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {
                _jumpToCity();
              },
            ),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  _jumpToCity() {
    AppRoute.pushResult(context, Routers.cityPage,(result){
       setState(() {
         currCity=result;
       });
    });
  }

  //同行程
  _jumpToSearch() {
    AppRoute.push(context, Routers.rideQueryPage);
  }

  //下拉刷新
  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      RumourDao.getRumor().then((rumor){
        setState(() {
          homeModel=model;
          rumours=rumor;
          _loading = false;
        });
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
    return null;
  }
}
