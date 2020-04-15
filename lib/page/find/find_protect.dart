import 'package:chapter13/model/find_protect_model.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/utils/date_utils.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProtectView extends StatefulWidget {
  List<dynamic> protects;

  ProtectView({Key key, @required this.protects}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProtectState(protects);
  }
}

class ProtectState extends State<ProtectView> {
  List<dynamic> protects;

  ProtectState(this.protects);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: protects.map(buildItem).toList(),
        ));
  }

  Widget buildItem(item) {
    ProtectModel model = item;
    return Container(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model?.title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Space(),
                        Text(
                          '更新时间：'+DateUtils.formatTime(model?.createTime),
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ),
                  Space(),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(model?.imgUrl,
                          width: 100, height: 80, fit: BoxFit.fill))
                ],
              ),
              Space(),
              Divider(
                height: 0.5,
                color: Colors.grey,
              ),
            ],
          ),
          onTap: () {
            AppRoute.push(context, Routers.webViewPage, params: {
              'url': model.linkUrl,
              'title': model.title,
            });
          },
        ));
  }
}
