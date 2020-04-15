import 'package:chapter13/generated/json/base/json_convert_content.dart';

class MapDistributeModel with JsonConvert<MapDistributeModel> {
	List<MapDistribute> results;
	bool success;
}

class MapDistribute with JsonConvert<MapDistribute> {
	String country;
	String provinceName;
	String provinceShortName;
	int confirmedCount;
	int suspectedCount;
	int curedCount;
	int deadCount;
	List<dynamic> cities;
	String comment;
	int updateTime;
	int createTime;
	int modifyTime;
}
