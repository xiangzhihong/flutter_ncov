
import 'package:chapter13/res/gaps.dart';
import 'package:chapter13/res/styles.dart';
import 'package:chapter13/utils/image_utils.dart';
import 'package:flutter/cupertino.dart';


/**
 * 各种状态的Layout
 */
class StateLayout extends StatefulWidget {
  
  const StateLayout({
    Key key,
    @required this.type,
    this.hintText
  }):super(key: key);
  
  final StateType type;
  final String hintText;
  
  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  
  String _img;
  String _hintText;
  
  @override
  Widget build(BuildContext context) {
    switch (widget.type){
      case StateType.network:
        _img = "zwwl";
        _hintText = "无网络连接";
        break;
      case StateType.message:
        _img = "zwxx";
        _hintText = "暂无消息";
        break;
      case StateType.loading:
        _img = "";
        _hintText = "";
        break;
      case StateType.empty:
        _img = "";
        _hintText = "";
        break;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.type == StateType.loading ? const CupertinoActivityIndicator(radius: 16.0) :
          (widget.type == StateType.empty ? Gaps.empty :
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ImageUtils.getAssetImage("state/$_img"),
              ),
            ),
          )),
          Gaps.vGap16,
          Text(
            widget.hintText ?? _hintText,
            style: TextStyles.textGray14,
          ),
          Gaps.vGap50,
        ],
      ),
    );
  }
}

enum StateType {
  // 无网络
  network,
  // 消息
  message,
  // 加载中
  loading,
  // 空数据
  empty
}