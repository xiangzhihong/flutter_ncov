import 'package:chapter13/model/find_wiki_model.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:chapter13/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WikiView extends StatelessWidget {

  FindWikiModel model;

  WikiView({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: model.result.length,
            itemBuilder: (BuildContext context, int index) {
              return WikiItem(model.result[index]);
            }));
  }
}

class WikiItem extends StatelessWidget {
  final FindWikiResult result;

  WikiItem(this.result);

  @override
  Widget build(BuildContext context) {
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
                          result?.title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Space(),
                        Text(
                          result?.description,
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ),
                  Space(),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(result?.imgUrl,
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
              'url': result.linkUrl,
              'title': result.title,
            });
          },
        ));
  }
}
