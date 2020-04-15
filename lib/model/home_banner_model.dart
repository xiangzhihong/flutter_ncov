import 'package:chapter13/generated/json/base/json_convert_content.dart';

/**
 * 首页Banner
 */
class HomeBannerModel with JsonConvert<HomeBannerModel> {
	List<HomeBannerData> data;
}

class HomeBannerData with JsonConvert<HomeBannerData> {
	int id;
	String image;
	String url;
	String title;
}
