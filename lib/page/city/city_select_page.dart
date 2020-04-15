import 'dart:convert';
import 'package:chapter13/model/city_model.dart';
import 'package:chapter13/res/colors.dart';
import 'package:chapter13/res/styles.dart';
import 'package:chapter13/widget/nav_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';

class CitySelectPage extends StatefulWidget {
  @override
  _CitySelectPageState createState() => _CitySelectPageState();
}

class _CitySelectPageState extends State<CitySelectPage> {

  List<CityModel> _cityList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    String jsonStr;
    jsonStr = await rootBundle.loadString('assets/data/city.json');
//    jsonStr = await loadString('assets/data/china.json');
    List list = json.decode(jsonStr);
    list.forEach((value) {
      _cityList.add(CityModel.fromJsonMap(value));
    });
    setState(() {

    });
  }

  /// rootBundle.loadString源码修改
  Future<String> loadString(String key, { bool cache = true }) async {
    final ByteData data = await rootBundle.load(key);
    if (data == null)
      throw FlutterError('Unable to load asset: $key');
    return utf8.decode(data.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: "选择城市",
      ),
      body: SafeArea(
        child: AzListView(
          data: _cityList,
          itemBuilder: (context, model) => _buildListItem(model),
          isUseRealIndex: true,
          itemHeight: 40,
          suspensionWidget: null,
          suspensionHeight: 0,
          indexBarBuilder:(context, list, onTouch){
            return IndexBar(
                onTouch: onTouch,
                data: list,
                itemHeight: 18,
                touchDownColor: Colors.transparent,
                textStyle: TextStyles.textGray12
            );
          },
        ),
      ),
    );
  }

  Widget _buildListItem(CityModel model) {
    return InkWell(
      onTap: (){
        print("OnItemClick: "+model.name);
        Navigator.pop(context, model.name);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 34.0),
        height: 40.0,
        child: Container(
          decoration: BoxDecoration(
              border: (model.isShowSuspension && model.cityCode != "0483") ? Border(
                top: Divider.createBorderSide(context, color: Colours.line, width: 0.6),
              ) : null
          ),
          child: Row(
            children: <Widget>[
              Opacity(
                  opacity: model.isShowSuspension ? 1 : 0,
                  child: SizedBox(
                    width: 28.0,
                    child: Text(model.firstCharacter, style: TextStyles.textDark14),
                  )
              ),
              Expanded(
                child: Text(model.name, style: TextStyles.textDark14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
