import 'package:chapter13/generated/json/base/json_convert_content.dart';


/**
 * 国内疫情地区统计
 */
class MapDomesticModel with JsonConvert<MapDomesticModel> {
	int code;
	String msg;
	List<MapDomesticNewslist> newslist;
}

class MapDomesticNewslist with JsonConvert<MapDomesticNewslist> {
	String provinceName;
	String provinceShortName;
	int currentConfirmedCount;
	int confirmedCount;
	int suspectedCount;
	int curedCount;
	int deadCount;
	String comment;
	int locationId;
	List<MapDomesticNewslistCity> cities;
}

class MapDomesticNewslistCity with JsonConvert<MapDomesticNewslistCity> {
	String cityName;
	int currentConfirmedCount;
	int confirmedCount;
	int suspectedCount;
	int curedCount;
	int deadCount;
	int locationId;
}
