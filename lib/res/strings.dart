import 'dart:io';
import 'package:chapter13/model/home_banner_model.dart';
import 'package:chapter13/page/home/home_guide.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class Strings {
  static String device() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    }
    return 'unknow';
  }

  static List<ItemViewModel> bannerList = [
    ItemViewModel(
        icon: "https://p0.ssl.qhimg.com/t01643e12f0b4dc4c11.jpg",
        url:"http://www.360kuai.com/pc/detail?url=http%3A%2F%2Ffawen.news.so.com%2F1de82014f966e0d766d6147c8c468fce&check=32b11005d9a12bcf&sign=360_6aa05217&uid=0fc46f3eed8debd942666e026769edbc&fr=zhuanti",
        title: "大量回国人员绕道香港回深圳"),
    ItemViewModel(
        icon: "https://p0.ssl.qhimg.com/t01fc339335e826233f.png",
        url:"http://www.360kuai.com/pc/detail?url=http%3A%2F%2Ffawen.news.so.com%2Fb337b4ce04cef4e95e2bc9fbeeeb28ce&check=300a350fed1c42b8&sign=360_6aa05217&uid=0fc46f3eed8debd942666e026769edbc&fr=zhuanti",
        title: "疫情之下：一家互联网公司的复工之路")
  ];

  // 首页的导航
  static List<ItemViewModel> gridList = [
    ItemViewModel(
        title: '附近疫情',
        icon: 'assets/images/channel_nearby.png',
        url:
            'http://h5.mse.360.cn/pc/yiqingmap.html?from=360kuaizixun&from2=360_6aa05217'),
    ItemViewModel(
        title: '谣言识别',
        icon: 'assets/images/channel_ai.png',
        url:
            'http://m.look.360.cn/subject/400?sign=360_6aa05217&whprovince=shanghai'),
    ItemViewModel(
        title: '焦点动态',
        icon: 'assets/images/channel_dynamic.png',
        url:
            'http://m.look.360.cn/subject/400?sign=360_6aa05217&whprovince=shanghai'),
    ItemViewModel(
        title: '患者救助',
        icon: 'assets/images/channel_help.png',
        url:
            'https://jinshuju.net/f/WKkHTv?from=360kuaizixun&from2=360_6aa05217'),
    ItemViewModel(
      title: '防护手册',
      icon: 'assets/images/channel_protect.png',
      url:
          'https://www.360kuai.com/mob/subject/405?sign=360_6aa05217&sign=360_6aa05217',
    ),
    ItemViewModel(
      title: '免费问诊',
      icon: 'assets/images/channel_free_inquriy.png',
      url:
          'https://m.so.com/mhtml/zt/medical-all.html?from=360kuaizixun&from2=360_6aa05217',
    ),
    ItemViewModel(
      title: '发热门诊',
      icon: 'assets/images/channel_outpatient.png',
      url:
          'https://ditu.so.com/zt/feverhospital/?from=360kuaizixun&from2=360_6aa05217',
    ),
    ItemViewModel(
      title: '迁徙地图',
      icon: 'assets/images/channel_map.png',
      url:
          'https://ditu.so.com/zt/qianxi/?from=360kuaizixun&from2=360_6aa05217',
    ),
  ];
}
