import 'package:chapter13/res/dimens.dart';
import 'package:chapter13/routers/app_route.dart';
import 'package:flutter/material.dart';

//自定义dialog
class BaseDialog extends StatelessWidget {
  const BaseDialog(
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // 键盘弹出收起动画过渡
      body: AnimatedContainer(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInCubic,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            width: 280.0,
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: hiddenTitle,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      hiddenTitle ? "" : title,
                      style: TextStyle(
                          fontSize: Dimens.font_sp18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(child: child),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 0.6,
                  width: double.infinity,
                  child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 48.0,
                        child: FlatButton(
                          child: const Text(
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
                    const SizedBox(
                      height: 48.0,
                      width: 0.6,
                      child: const DecoratedBox(
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
                )
              ],
            )),
      ),
    );
  }
}
