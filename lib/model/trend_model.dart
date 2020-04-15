import 'package:chapter13/generated/json/base/json_convert_content.dart';

class TrendModel with JsonConvert<TrendModel> {
	int code;
	String msg;
	List<TrendNewslist> newslist;
}

class TrendNewslist with JsonConvert<TrendNewslist> {
	int modifyTime;          //数据修改时间
	String continents;       //大洲
	String provinceName;     //地区名
	int currentConfirmedCount;    //现存确诊人数
	int confirmedCount;           //累计确诊人数
	int confirmedCountRank;
	int curedCount;
	int deadCount;               //死亡人数
	int deadCountRank;
	String deadRate;
	int deadRateRank;
	int locationId;
	String countryShortCode;
}
