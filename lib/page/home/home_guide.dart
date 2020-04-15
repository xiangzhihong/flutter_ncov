import 'package:chapter13/res/strings.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeGuideView extends StatelessWidget {

  List<ItemViewModel> list = Strings.gridList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        children: list.map((item) => GuideItem(data: item)).toList(),
      ),
    );
  }
}


//Grid Item
class GuideItem extends StatelessWidget {

  final ItemViewModel data;
  GuideItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 5),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Image.asset(
                this.data.icon,
                width: 45,
              ),
              Text(
                this.data.title,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          onTap: (){
            AppRoute.push(context, Routers.webViewPage,params: {
              'url':data.url,
              'title':data.title,
            });
          },
        )
    );
  }
}

class ItemViewModel {
  final String icon;
  final String title;
  final String url;

  const ItemViewModel({
    this.title,
    this.icon,
    this.url,
  });
}