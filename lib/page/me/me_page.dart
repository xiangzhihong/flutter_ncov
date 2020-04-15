import 'package:chapter13/page/me/me_service_cell.dart';
import 'package:chapter13/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'me_header.dart';
import 'me_list_cell.dart';

/**
 * 疫情进展
 */
class MePage extends StatelessWidget {
  Widget buildServiceCells(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MeServiceCell(
            title: '我的问诊',
            iconName: 'assets/images/ic_inquiry_me.png',
            onPressed: () {
              ToastUtil.show('我的问诊');
            },
          ),
          MeServiceCell(
            title: '我的处方',
            iconName: 'assets/images/ic_prescription_me.png',
            onPressed: () {},
          ),
          MeServiceCell(
            title: '我的订单',
            iconName: 'assets/images/ic_drug_me.png',
            onPressed: () {},
          ),
          MeServiceCell(
            title: '医师讲课',
            iconName: 'assets/images/ic_lecture_me.png',
            onPressed: () {},
          ),
          MeServiceCell(
            title: '成长测评',
            iconName: 'assets/images/ic_growth_me.png',
            onPressed: () {},
          )
        ],
      ),
    );
  }


  Widget buildCells(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MeCell(
            title: '我的钱包',
            iconName: 'assets/images/me_wallet.png',
            onPressed: () {

            },
          ),
          MeCell(
            title: '我的会员',
            iconName: 'assets/images/me_vip.png',
            onPressed: () {},
          ),
          MeCell(
            title: '私人医生',
            iconName: 'assets/images/me_comment.png',
            onPressed: () {},
          ),
          MeCell(
            title: '我的收藏',
            iconName: 'assets/images/me_favorite.png',
            onPressed: () {},
          ),
          MeCell(
            title: '设置',
            iconName: 'assets/images/me_setting.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              MeHeader(),
              SizedBox(height: 5),
              buildServiceCells(context),
              SizedBox(height: 5),
              buildCells(context)
            ],
          ),
        ),
      ),
    );


  }
}


