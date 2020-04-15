
import 'package:chapter13/widget/state_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/**
 * 支持下拉刷新与加载更多
 */
class RefreshListView extends StatefulWidget {

  const RefreshListView({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.onRefresh,
    this.loadMore,
    this.hasMore : false,
    this.stateType : StateType.empty,
    this.pageSize : 10,
    this.padding,
    this.itemExtent,
  }): super(key: key);

  final RefreshCallback onRefresh;
  final LoadMoreCallback loadMore;
  final int itemCount;
  final bool hasMore;
  final IndexedWidgetBuilder itemBuilder;
  final StateType stateType;
  /// 一页的数量，默认为10
  final int pageSize;
  final EdgeInsetsGeometry padding;
  final double itemExtent;

  @override
  _RefreshListViewState createState() => _RefreshListViewState();
}

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class _RefreshListViewState extends State<RefreshListView> {

  // 是否正在加载数据
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener(
        onNotification: (ScrollNotification note){
          //确保是垂直方向滚动，且滑动至底部
          if (note.metrics.pixels == note.metrics.maxScrollExtent && note.metrics.axis == Axis.vertical){
            _loadMore();
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: widget.onRefresh,
          child: widget.itemCount == 0 ? StateLayout(type: widget.stateType) : ListView.builder(
            itemCount: widget.loadMore == null ? widget.itemCount : widget.itemCount + 1,
            padding: widget.padding,
            itemExtent: widget.itemExtent,
            itemBuilder: (BuildContext context, int index){
              // 不需要加载更多则不需要添加FootView
              if (widget.loadMore == null){
                return widget.itemBuilder(context, index);
              }else{
                return index < widget.itemCount ? widget.itemBuilder(context, index) : MoreWidget(widget.itemCount, widget.hasMore, widget.pageSize);
              }
            }
          )
        ),
      ),
    );
  }

  Future _loadMore() async {
    if (widget.loadMore == null){
      return;
    }
    if (_isLoading) {
      return;
    }
    if (!widget.hasMore){
      return;
    }
    _isLoading = true;
    await widget.loadMore();
    _isLoading = false;
  }

}

class MoreWidget extends StatelessWidget {
  
  const MoreWidget(this.itemCount, this.hasMore, this.pageSize);

  final int itemCount;
  final bool hasMore;
  final int pageSize;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          hasMore ? Row(children: <Widget>[
            CupertinoActivityIndicator(),
            Text(
              '正在加载中',
              style: TextStyle(
                  fontSize: 13.0, color: Color(0xff999999)),
            )
          ],)  : SizedBox(),
          hasMore ? SizedBox(width: 5) : SizedBox(),
          // 只有一页的时候，就不显示FooterView
          Text(hasMore ? '...' : (itemCount < pageSize ? '' : '我是有底线的呦~'), style: const TextStyle(color: const Color(0x8A000000))),
        ],
      ),
    );
  }
}

