import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/widget/basic_dialog.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/material.dart';


/**
 * 出行方式
 */
class TravelDialog extends StatefulWidget {

  TravelDialog({
    Key key,
    this.value,
    this.onPressed,
  }) : super(key: key);

  final List<int> value;
  final Function(List) onPressed;

  @override
  _TravelState createState() => _TravelState();
}


class _TravelState extends State<TravelDialog> {

  List _selectValue = List();
  var _list = ["飞机", "火车", "轮船", "客车", "公交车", "出租车", "其他"];

  Widget getItem(int index) {
    _selectValue = widget.value ?? [0];
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Space(),
              Expanded(
                child: Text(
                  _list[index],
                ),
              ),
              Image.asset(
                  _selectValue.contains(index)
                      ? "assets/images/checkbox_p.png"
                      : "assets/images/checkbox_n.png",
                  width: 23.0,
                  height: 23.0),
              Space(),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _selectValue.clear();
            _selectValue.add(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: "出行方式",
      child: Container(
        height: 180,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getItem(0),
              getItem(1),
              getItem(2),
              getItem(3),
              getItem(4),
              getItem(5),
              getItem(6),
            ],
          ),
        ),
      ),
      onPressed: () {
        AppRoute.pop(context);
        widget.onPressed(_selectValue);
      },
    );
  }
}


