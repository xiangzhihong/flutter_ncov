import 'package:chapter13/res/dimens.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:flutter/material.dart';

//自定义dialog
class BasicDialog extends Dialog {

  const BasicDialog(
      {Key key,
      this.title,
      this.onPressed,
      this.hiddenTitle: false,
      @required this.child})
      : super(key: key);

  final String title;
  final Function onPressed;
  final Widget child;
  final bool hiddenTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Container(
      width: 280,
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTitle(),
          Flexible(child: child),
          _buildAction(context)
        ],
      ),
    )));
  }

  Widget _buildTitle() {
    return Text(
      hiddenTitle ? "" : title,
      style: TextStyle(
          color: Colors.black54,
          fontSize: Dimens.font_sp18,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAction(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 45.0,
            child: FlatButton(
              child: Text(
                "取消",
                style: TextStyle(fontSize: Dimens.font_sp18),
              ),
              textColor: Colors.grey,
              onPressed: () {
                AppRoute.pop(context);
              },
            ),
          ),
        ),
        SizedBox(
          height: 48.0,
          width: 0.6,
          child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(
          child: SizedBox(
            height: 48.0,
            child: FlatButton(
              child: const Text(
                "确定",
                style: TextStyle(fontSize: Dimens.font_sp18),
              ),
              textColor: Color(0xFF4688FA),
              onPressed: () {
                onPressed();
              },
            ),
          ),
        )
      ],
    );
  }
}
