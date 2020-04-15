import 'package:chapter13/generated/json/base/json_convert_content.dart';

class HomeModel with JsonConvert<HomeModel> {
	int id;
	int createTime;
	int modifyTime;
	String infectSource;
	String passWay;
	String imgUrl;
	String dailyPic;
	List<String> dailyPics;
	String summary;
	bool deleted;
	String countRemark;
	int currentConfirmedCount;
	int confirmedCount;
	int suspectedCount;
	int curedCount;
	int deadCount;
	int seriousCount;
	int suspectedIncr;
	int currentConfirmedIncr;
	int confirmedIncr;
	int curedIncr;
	int deadIncr;
	int seriousIncr;
	String virus;
	String remark1;
	String remark2;
	String remark3;
	String remark4;
	String remark5;
	String note1;
	String note2;
	String note3;
	String generalRemark;
	String abroadRemark;
	List<HomeMarquee> marquee;
	List<HomeQuanguoTrendChart> quanguoTrendChart;
	List<HomeHbFeiHbTrendChart> hbFeiHbTrendChart;
	List<HomeForeignTrendChart> foreignTrendChart;
	List<HomeImportantForeignTrendChart> importantForeignTrendChart;
	List<HomeForeignTrendChartGlobal> foreignTrendChartGlobal;
	List<HomeImportantForeignTrendChartGlobal> importantForeignTrendChartGlobal;
	HomeForeignStatistics foreignStatistics;
	HomeGlobalStatistics globalStatistics;
}

class HomeMarquee with JsonConvert<HomeMarquee> {
	int id;
	String marqueeLabel;
	String marqueeContent;
	String marqueeLink;
}

class HomeQuanguoTrendChart with JsonConvert<HomeQuanguoTrendChart> {
	String imgUrl;
	String title;
}

class HomeHbFeiHbTrendChart with JsonConvert<HomeHbFeiHbTrendChart> {
	String imgUrl;
	String title;
}

class HomeForeignTrendChart with JsonConvert<HomeForeignTrendChart> {
	String imgUrl;
	String title;
}

class HomeImportantForeignTrendChart with JsonConvert<HomeImportantForeignTrendChart> {
	String imgUrl;
	String title;
}

class HomeForeignTrendChartGlobal with JsonConvert<HomeForeignTrendChartGlobal> {
	String imgUrl;
	String title;
}

class HomeImportantForeignTrendChartGlobal with JsonConvert<HomeImportantForeignTrendChartGlobal> {
	String imgUrl;
	String title;
}

class HomeForeignStatistics with JsonConvert<HomeForeignStatistics> {
	int currentConfirmedCount;
	int confirmedCount;
	int suspectedCount;
	int curedCount;
	int deadCount;
	int suspectedIncr;
	int currentConfirmedIncr;
	int confirmedIncr;
	int curedIncr;
	int deadIncr;
}

class HomeGlobalStatistics with JsonConvert<HomeGlobalStatistics> {
	int currentConfirmedCount;
	int confirmedCount;
	int curedCount;
	int deadCount;
	int currentConfirmedIncr;
	int confirmedIncr;
	int curedIncr;
	int deadIncr;
}
