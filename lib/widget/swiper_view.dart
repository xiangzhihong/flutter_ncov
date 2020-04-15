import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperView extends StatelessWidget {

  final List swiperList;

  SwiperView({Key key,this.swiperList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperList[index]['image']}",fit:BoxFit.fill);
        },
        itemCount: swiperList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}