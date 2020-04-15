import 'package:chapter13/model/home_rumour_model.dart';
import 'package:chapter13/widget/rumor_card.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 最新辟谣
 */

class HomeRumourView extends StatelessWidget {
  List<dynamic> rumours;

  HomeRumourView({Key key, @required this.rumours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: rumours.map(buildItem).toList(),
        ));
  }

  Widget buildItem(item) {
    HomeRumourModel model = item;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),color: Colors.red),
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
                        model?.title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Space(),
                      Text(
                        model?.mainSummary,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xff999999),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
