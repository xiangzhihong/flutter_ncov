import 'package:chapter13/model/home_model.dart';
import 'package:chapter13/widget/marquee_vertical_view.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMarqueeView extends StatelessWidget {

  //滚动时间
  var duration = const Duration(milliseconds: 3500);

  List<String> messages=List();
  final HomeModel model;

  HomeMarqueeView({Key key, @required this.model}) : super(key: key){
    if(model!=null){
      model.marquee.map((item){
        if(item.marqueeContent!=null)
        messages.add(item.marqueeContent);
      }).toList();
    }
  }

//  var tags = [
//    "卫健委发布公众科学戴口罩指引",
//    "拜耳开除违反居家隔离政策员工",
//    "全球现存新冠病毒感染者破 10 万"
//  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/marquee.png',
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
          Space(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: NoticeVerticalView(duration: duration, messages: messages),
          )
        ],
      ),
    );
  }
}
