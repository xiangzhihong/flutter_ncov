import 'package:chapter13/model/find_news_model.dart';
import 'package:chapter13/utils/date_utils.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {

  List<dynamic> news;
  List<dynamic> recentNews=List();

  NewsView({Key key, @required this.news}) : super(key: key){
    if(news.length<100){
       for(int i=0;i<news.length;i++)
       recentNews.add(news[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: news.map(buildItem).toList(),
        ));
  }

  Widget buildItem(item) {
    NewsModel model = item;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model?.title,
                  style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Space(height: 5),
                Text(
                  model?.summary,
                  style: TextStyle(
                      fontSize: 12.0, color: Color(0xff999999)),
                ),
                Space(height: 5),
                Text(
                  model?.infoSource,
                  style: TextStyle(
                      fontSize: 12.0, color: Color(0xff999999)),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
