import 'package:chapter13/model/map_distribute_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

class MapDistributeWidget extends StatelessWidget {

  final List<MapDistribute> models;
  MapDistributeWidget({@required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MyWebView(models:this.models),
    );
  }
}

class MyWebView extends StatefulWidget {

  List<MapDistribute> models;
  MyWebView({@required this.models});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<MyWebView> {

  WebViewController _webViewController;
  String filePath = 'assets/map/index.html';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
      height: 300.0,
    );
  }


  _loadHtmlFromAssets() async {
    var js = _modelsToJs(widget.models);
    String jsString = json.encode(js);

    String fileHtmlContents = await rootBundle.loadString(filePath);
    fileHtmlContents = fileHtmlContents.replaceAll('var mapData = {};', 'var mapData = ${jsString};');
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _htmString() async {
    var js = _modelsToJs(widget.models);
    String jsString = json.encode(js);
    String fileHtmlContents = await rootBundle.loadString(filePath);
    fileHtmlContents = fileHtmlContents.replaceAll('var mapData = {};', 'var mapData = ${jsString};');
    return Uri.dataFromString(fileHtmlContents,
    mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    .toString();
  }

  _modelsToJs(List<MapDistribute> list) {
    Map result = Map();
    list.forEach((item) {
      MapDistribute tmpItem = item;
      Map tmp = tmpItem.toJson();
      tmp.remove('cities');
      result[tmpItem.provinceShortName] = tmp;
    });
    return result;
  }
}

