import 'package:chapter13/dao/find_protect_dao.dart';
import 'package:chapter13/dao/find_wiki_dao.dart';
import 'package:chapter13/model/find_wiki_model.dart';
import 'package:chapter13/page/find/find_protect.dart';
import 'package:chapter13/widget/item_title_view.dart';
import 'package:chapter13/widget/loading_container.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'find_wiki.dart';

/**
 * 看一看（新闻）
 */
class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> {

  bool _loading = false;
  FindWikiModel wikiModel;
  List<dynamic> protectList = List();

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('看一看'),
        centerTitle: true,
      ),
      body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              RefreshIndicator(
                  onRefresh: _handleRefresh,
              child: NotificationListener(
                onNotification: (scrollNotification) {

                },
                child: _listView,
              ))
            ],
          )),
    );
  }

  Widget get _listView {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Image.asset('assets/images/top_head.png', fit: BoxFit.fill,),
          Space(height: 10),
          TitleView('疫情科普'),
          Space(height: 10),
          WikiView(model:wikiModel),
          TitleView('防护贴士'),
          ProtectView(protects: protectList),
        ],
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    try {
      FindWikiModel model = await WikiDao.getWiki();
      setState(() {
        wikiModel=model;
        _loading = false;
      });
      ProtectDao.getProtects().then((data) {
        setState(() {
          protectList = data;
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
