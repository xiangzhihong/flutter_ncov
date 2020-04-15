import 'package:chapter13/dao/home_banner_dao.dart';
import 'package:chapter13/model/home_banner_model.dart';
import 'package:chapter13/res/strings.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:chapter13/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'home_guide.dart';


class HomeBannerView extends StatelessWidget {

  List<ItemViewModel> banner;
  HomeBannerView(this.banner);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 160,
      child: Swiper(
        itemCount: banner.length,
        autoplay: true,
        autoplayDelay: 3000,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AppRoute.push(context, Routers.webViewPage,params: {
                'url':banner[index].url,
                'title':banner[index].title,
              });
            },
            child: Image.network(
              banner[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}

