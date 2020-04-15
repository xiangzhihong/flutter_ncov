import 'dart:async';
import 'dart:io';

import 'package:chapter13/res/dimens.dart';
import 'package:chapter13/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'find/find_page.dart';
import 'map/map_page.dart';
import 'home/home_page.dart';
import 'me/me_page.dart';

class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int _selectIndex = 0;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: LoadImage('assets/images/tab_home_n.png'),
      activeIcon: LoadImage('assets/images/tab_home_p.png'),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: LoadImage('assets/images/tab_find_n.png'),
      activeIcon: LoadImage('assets/images/tab_find_p.png'),
      title: Text('看一看'),
    ),
    BottomNavigationBarItem(
      icon: LoadImage('assets/images/tab_map_n.png'),
      activeIcon: LoadImage('assets/images/tab_map_p.png'),
      title: Text('地图'),
    ),
    BottomNavigationBarItem(
      icon: LoadImage('assets/images/tab_me_n.png'),
      activeIcon: LoadImage('assets/images/tab_me_p.png'),
      title: Text('我的'),
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    FindPage(),
    MapPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectIndex,
          items: bottomTabs,
          selectedFontSize: Dimens.font_sp14,
          unselectedFontSize: Dimens.font_sp14,

          onTap: (index) {
            onTapped(index);
          },
        ),
        body: IndexedStack(
          index: _selectIndex,
          children: tabBodies,
        ),
      ),
      onWillPop: () async{
        DateTime last ;
        if(last == null || DateTime.now().difference(last) > Duration(seconds: 2)){
          last = DateTime.now();
          ToastUtil.show('再按一次退出应用');
        }else{
          last = DateTime.now();
          // 退出app
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
    );
  }

  onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

   _onWillPop() async {
     DateTime last ;
    if(last == null || DateTime.now().difference(last) > Duration(seconds: 2)){
      last = DateTime.now();
      ToastUtil.show('再按一次退出应用');
    }else{
      last = DateTime.now();
      // 退出app
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
  
}

class LoadImage extends StatelessWidget {

  final String img;

  LoadImage(this.img);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        img,
        fit: BoxFit.cover,
        width: 22.0,
        height: 22.0
    );
  }
}
