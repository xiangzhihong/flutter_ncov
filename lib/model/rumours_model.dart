import 'package:chapter13/generated/json/base/json_convert_content.dart';


/**
 * 权威辟谣，支持上拉加载更多
 */
class RumoursModel with JsonConvert<RumoursModel> {
	int code;
	String msg;
	List<RumoursNews> newslist;
}

class RumoursNews with JsonConvert<RumoursNews> {
	String id;
	String date;
	String title;
	String explain;
	String imgsrc;
	String markstyle;
	String desc;
	String author;
}
