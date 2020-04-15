import 'package:chapter13/widget/space.dart';
import 'package:flutter/material.dart';

/**
 * 自定义列表标题
 */
class TitleView extends StatelessWidget {
  final String title;
  final String subTitle;
  final GestureTapCallback onTap;

  TitleView(this.title, {this.subTitle = '', this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 67, 54),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          width: 5.0,
          height: 15.0,
        ),
        Space(width: 10.0),
        Text(
          '$title',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        GestureDetector(
          child: Text(
            '$subTitle',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: (){
            if (onTap != null) {
              onTap();
            }
          },
        ),
        Space(),
      ],
    );
  }
}
