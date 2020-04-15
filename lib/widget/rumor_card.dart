import 'package:chapter13/model/home_rumour_model.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/material.dart';

class RumorCard extends StatelessWidget {

  HomeRumourModel model;
  final GestureTapCallback onTap;

  RumorCard(this.model, {this.onTap});

  static TextStyle defStyle = TextStyle(
      color: Color(0xff999999), fontSize: 16.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${model?.title ?? '未知'}',
            style: defStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${model?.mainSummary ?? '未知'}',
                    style: TextStyle(fontSize: 14)),
                Visibility(
                  visible: model.isOpen,
                  child: Text(
                    '${model?.body ?? '未知'}',
                    style: TextStyle(color: Color(0xff999999), fontSize: 16.0),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '${model.isOpen ? '收起' : '展开'}详情',
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          model.isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Color(0xff999999),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    if (onTap != null) {
                      onTap();
                    }
                  },
                ),
                Space(),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
