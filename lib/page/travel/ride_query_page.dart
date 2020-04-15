import 'package:chapter13/page/travel/travel_dialog.dart';
import 'package:chapter13/utils/toast_utils.dart';
import 'package:chapter13/widget/nav_appbar.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 同行程查询
 */

class RideQueryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RideQueryState();
  }
}

class _RideQueryState extends State<RideQueryPage> {
  String trainNumber = "0";
  var _selectValue = [0];
  String _time = DateTime.now().toString().substring(0, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(centerTitle: "同行程查询"),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 140,
                      child: Image.asset(
                        'assets/images/ride_query_bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120, left: 8, right: 8),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              buildTitle(),
                              Space(height: 20),
                              buildTravelWay(),
                              Space(height: 20),
                              buildTravelTime(),
                              Space(height: 10),
                              buildTravelNum(),
                              buildTravelCity(),
                              Space(height: 15),
                              buildOperate()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }

  buildTitle() {
    return Text('输入任意一项即可查询',
        style: TextStyle(fontSize: 13, color: Colors.grey));
  }

  Widget buildTravelWay() {
    return Row(
      children: <Widget>[
        Text('出行方式',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Space(width: 15),
        Expanded(
          flex: 1,
          child: GestureDetector(
            child: Text(_getType(),
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            onTap: () {
              _showTravelWay();
            },
          ),
        )
      ],
    );
  }

  Widget buildTravelTime() {
    return Row(
      children: <Widget>[
        Text('出行日期',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Space(width: 15),
        Expanded(
          flex: 1,
          child: GestureDetector(
            child:
                Text(_time, style: TextStyle(fontSize: 14, color: Colors.grey)),
            onTap: () {
              _showDataPicker();
            },
          ),
        )
      ],
    );
  }

  Widget buildTravelNum() {
    final TextEditingController _controller = TextEditingController();

    return Row(
      children: <Widget>[
        Text('出行车次',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Space(width: 15),
        Expanded(
          flex: 1,
          child: TextField(
              controller: _controller,
              autofocus: false,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '如车次、航班号、车牌',
                hintStyle: TextStyle(fontSize: 14),
              )),
        )
      ],
    );
  }

  Widget buildTravelCity() {
    final TextEditingController _controller = TextEditingController();

    return Row(
      children: <Widget>[
        Text('出行城市',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Space(width: 15),
        Expanded(
          flex: 1,
          child: TextField(
              controller: _controller,
              autofocus: false,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '如湖北、武汉',
                hintStyle: TextStyle(fontSize: 14),
              )),
        )
      ],
    );
  }

  buildOperate() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: OutlineButton(
              onPressed: () {
                ToastUtil.show('清空查询');
                cleanHistory();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                '清空查询',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Space(
            width: 30,
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                ToastUtil.show('去查询');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              color: Colors.red,
              child: Text(
                '去查询',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }

  _getType() {
    var _list = ["飞机", "火车", "轮船", "客车", "公交车", "出租车", "其他"];
    String type = "";
    for (int s in _selectValue) {
      if (s == 0) {
        type = _list[0];
      } else if (s == 1) {
        type = _list[1];
      } else if (s == 2) {
        type = _list[2];
      } else if (s == 3) {
        type = _list[3];
      } else if (s == 4) {
        type = _list[4];
      } else if (s == 5) {
        type = _list[5];
      } else if (s == 6) {
        type = _list[6];
      }
    }
    return type;
  }

  //出行方式
  _showTravelWay() {
//    DialogUtil.showElasticDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return TravelWayDialog(
//            value: _selectValue,
//            onPressed: (value) {
//              setState(() {
//                _selectValue = value;
//              });
//            },
//          );
//        });
    showDialog(
        context: context,
        builder: (context) {
          return  TravelDialog(
              value: _selectValue,
              onPressed:(value){
                setState(() {
                  _selectValue = value;

                });
              },
          );
        });
  }

  //出行时间
  _showDataPicker() async {
    Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2021),
        locale: myLocale);
    setState(() {
      if (picker == null) {
        _time = "请选择日期";
      } else {
        _time = picker.toString().substring(0, 10);
      }
    });
  }

  void cleanHistory() {}
}
