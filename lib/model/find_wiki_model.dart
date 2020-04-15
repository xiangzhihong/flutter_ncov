import 'package:chapter13/generated/json/base/json_convert_content.dart';


/**
 * 疫情科普
 */
class FindWikiModel with JsonConvert<FindWikiModel> {
	int pageNum;
	int pageSize;
	int total;
	List<FindWikiResult> result;
}

class FindWikiResult with JsonConvert<FindWikiResult> {
	int id;
	String title;
	String imgUrl;
	String linkUrl;
	String description;
	int sort;
}
