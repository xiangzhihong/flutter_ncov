import 'package:chapter13/model/home_model.dart';

homeModelFromJson(HomeModel data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['modifyTime'] != null) {
		data.modifyTime = json['modifyTime']?.toInt();
	}
	if (json['infectSource'] != null) {
		data.infectSource = json['infectSource']?.toString();
	}
	if (json['passWay'] != null) {
		data.passWay = json['passWay']?.toString();
	}
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['dailyPic'] != null) {
		data.dailyPic = json['dailyPic']?.toString();
	}
	if (json['dailyPics'] != null) {
		data.dailyPics = json['dailyPics']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['deleted'] != null) {
		data.deleted = json['deleted'];
	}
	if (json['countRemark'] != null) {
		data.countRemark = json['countRemark']?.toString();
	}
	if (json['currentConfirmedCount'] != null) {
		data.currentConfirmedCount = json['currentConfirmedCount']?.toInt();
	}
	if (json['confirmedCount'] != null) {
		data.confirmedCount = json['confirmedCount']?.toInt();
	}
	if (json['suspectedCount'] != null) {
		data.suspectedCount = json['suspectedCount']?.toInt();
	}
	if (json['curedCount'] != null) {
		data.curedCount = json['curedCount']?.toInt();
	}
	if (json['deadCount'] != null) {
		data.deadCount = json['deadCount']?.toInt();
	}
	if (json['seriousCount'] != null) {
		data.seriousCount = json['seriousCount']?.toInt();
	}
	if (json['suspectedIncr'] != null) {
		data.suspectedIncr = json['suspectedIncr']?.toInt();
	}
	if (json['currentConfirmedIncr'] != null) {
		data.currentConfirmedIncr = json['currentConfirmedIncr']?.toInt();
	}
	if (json['confirmedIncr'] != null) {
		data.confirmedIncr = json['confirmedIncr']?.toInt();
	}
	if (json['curedIncr'] != null) {
		data.curedIncr = json['curedIncr']?.toInt();
	}
	if (json['deadIncr'] != null) {
		data.deadIncr = json['deadIncr']?.toInt();
	}
	if (json['seriousIncr'] != null) {
		data.seriousIncr = json['seriousIncr']?.toInt();
	}
	if (json['virus'] != null) {
		data.virus = json['virus']?.toString();
	}
	if (json['remark1'] != null) {
		data.remark1 = json['remark1']?.toString();
	}
	if (json['remark2'] != null) {
		data.remark2 = json['remark2']?.toString();
	}
	if (json['remark3'] != null) {
		data.remark3 = json['remark3']?.toString();
	}
	if (json['remark4'] != null) {
		data.remark4 = json['remark4']?.toString();
	}
	if (json['remark5'] != null) {
		data.remark5 = json['remark5']?.toString();
	}
	if (json['note1'] != null) {
		data.note1 = json['note1']?.toString();
	}
	if (json['note2'] != null) {
		data.note2 = json['note2']?.toString();
	}
	if (json['note3'] != null) {
		data.note3 = json['note3']?.toString();
	}
	if (json['generalRemark'] != null) {
		data.generalRemark = json['generalRemark']?.toString();
	}
	if (json['abroadRemark'] != null) {
		data.abroadRemark = json['abroadRemark']?.toString();
	}
	if (json['marquee'] != null) {
		data.marquee = new List<HomeMarquee>();
		(json['marquee'] as List).forEach((v) {
			data.marquee.add(new HomeMarquee().fromJson(v));
		});
	}
	if (json['quanguoTrendChart'] != null) {
		data.quanguoTrendChart = new List<HomeQuanguoTrendChart>();
		(json['quanguoTrendChart'] as List).forEach((v) {
			data.quanguoTrendChart.add(new HomeQuanguoTrendChart().fromJson(v));
		});
	}
	if (json['hbFeiHbTrendChart'] != null) {
		data.hbFeiHbTrendChart = new List<HomeHbFeiHbTrendChart>();
		(json['hbFeiHbTrendChart'] as List).forEach((v) {
			data.hbFeiHbTrendChart.add(new HomeHbFeiHbTrendChart().fromJson(v));
		});
	}
	if (json['foreignTrendChart'] != null) {
		data.foreignTrendChart = new List<HomeForeignTrendChart>();
		(json['foreignTrendChart'] as List).forEach((v) {
			data.foreignTrendChart.add(new HomeForeignTrendChart().fromJson(v));
		});
	}
	if (json['importantForeignTrendChart'] != null) {
		data.importantForeignTrendChart = new List<HomeImportantForeignTrendChart>();
		(json['importantForeignTrendChart'] as List).forEach((v) {
			data.importantForeignTrendChart.add(new HomeImportantForeignTrendChart().fromJson(v));
		});
	}
	if (json['foreignTrendChartGlobal'] != null) {
		data.foreignTrendChartGlobal = new List<HomeForeignTrendChartGlobal>();
		(json['foreignTrendChartGlobal'] as List).forEach((v) {
			data.foreignTrendChartGlobal.add(new HomeForeignTrendChartGlobal().fromJson(v));
		});
	}
	if (json['importantForeignTrendChartGlobal'] != null) {
		data.importantForeignTrendChartGlobal = new List<HomeImportantForeignTrendChartGlobal>();
		(json['importantForeignTrendChartGlobal'] as List).forEach((v) {
			data.importantForeignTrendChartGlobal.add(new HomeImportantForeignTrendChartGlobal().fromJson(v));
		});
	}
	if (json['foreignStatistics'] != null) {
		data.foreignStatistics = new HomeForeignStatistics().fromJson(json['foreignStatistics']);
	}
	if (json['globalStatistics'] != null) {
		data.globalStatistics = new HomeGlobalStatistics().fromJson(json['globalStatistics']);
	}
	return data;
}

Map<String, dynamic> homeModelToJson(HomeModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['createTime'] = entity.createTime;
	data['modifyTime'] = entity.modifyTime;
	data['infectSource'] = entity.infectSource;
	data['passWay'] = entity.passWay;
	data['imgUrl'] = entity.imgUrl;
	data['dailyPic'] = entity.dailyPic;
	data['dailyPics'] = entity.dailyPics;
	data['summary'] = entity.summary;
	data['deleted'] = entity.deleted;
	data['countRemark'] = entity.countRemark;
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['suspectedCount'] = entity.suspectedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['seriousCount'] = entity.seriousCount;
	data['suspectedIncr'] = entity.suspectedIncr;
	data['currentConfirmedIncr'] = entity.currentConfirmedIncr;
	data['confirmedIncr'] = entity.confirmedIncr;
	data['curedIncr'] = entity.curedIncr;
	data['deadIncr'] = entity.deadIncr;
	data['seriousIncr'] = entity.seriousIncr;
	data['virus'] = entity.virus;
	data['remark1'] = entity.remark1;
	data['remark2'] = entity.remark2;
	data['remark3'] = entity.remark3;
	data['remark4'] = entity.remark4;
	data['remark5'] = entity.remark5;
	data['note1'] = entity.note1;
	data['note2'] = entity.note2;
	data['note3'] = entity.note3;
	data['generalRemark'] = entity.generalRemark;
	data['abroadRemark'] = entity.abroadRemark;
	if (entity.marquee != null) {
		data['marquee'] =  entity.marquee.map((v) => v.toJson()).toList();
	}
	if (entity.quanguoTrendChart != null) {
		data['quanguoTrendChart'] =  entity.quanguoTrendChart.map((v) => v.toJson()).toList();
	}
	if (entity.hbFeiHbTrendChart != null) {
		data['hbFeiHbTrendChart'] =  entity.hbFeiHbTrendChart.map((v) => v.toJson()).toList();
	}
	if (entity.foreignTrendChart != null) {
		data['foreignTrendChart'] =  entity.foreignTrendChart.map((v) => v.toJson()).toList();
	}
	if (entity.importantForeignTrendChart != null) {
		data['importantForeignTrendChart'] =  entity.importantForeignTrendChart.map((v) => v.toJson()).toList();
	}
	if (entity.foreignTrendChartGlobal != null) {
		data['foreignTrendChartGlobal'] =  entity.foreignTrendChartGlobal.map((v) => v.toJson()).toList();
	}
	if (entity.importantForeignTrendChartGlobal != null) {
		data['importantForeignTrendChartGlobal'] =  entity.importantForeignTrendChartGlobal.map((v) => v.toJson()).toList();
	}
	if (entity.foreignStatistics != null) {
		data['foreignStatistics'] = entity.foreignStatistics.toJson();
	}
	if (entity.globalStatistics != null) {
		data['globalStatistics'] = entity.globalStatistics.toJson();
	}
	return data;
}

homeMarqueeFromJson(HomeMarquee data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['marqueeLabel'] != null) {
		data.marqueeLabel = json['marqueeLabel']?.toString();
	}
	if (json['marqueeContent'] != null) {
		data.marqueeContent = json['marqueeContent']?.toString();
	}
	if (json['marqueeLink'] != null) {
		data.marqueeLink = json['marqueeLink']?.toString();
	}
	return data;
}

Map<String, dynamic> homeMarqueeToJson(HomeMarquee entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['marqueeLabel'] = entity.marqueeLabel;
	data['marqueeContent'] = entity.marqueeContent;
	data['marqueeLink'] = entity.marqueeLink;
	return data;
}

homeQuanguoTrendChartFromJson(HomeQuanguoTrendChart data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeQuanguoTrendChartToJson(HomeQuanguoTrendChart entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeHbFeiHbTrendChartFromJson(HomeHbFeiHbTrendChart data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeHbFeiHbTrendChartToJson(HomeHbFeiHbTrendChart entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeForeignTrendChartFromJson(HomeForeignTrendChart data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeForeignTrendChartToJson(HomeForeignTrendChart entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeImportantForeignTrendChartFromJson(HomeImportantForeignTrendChart data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeImportantForeignTrendChartToJson(HomeImportantForeignTrendChart entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeForeignTrendChartGlobalFromJson(HomeForeignTrendChartGlobal data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeForeignTrendChartGlobalToJson(HomeForeignTrendChartGlobal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeImportantForeignTrendChartGlobalFromJson(HomeImportantForeignTrendChartGlobal data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeImportantForeignTrendChartGlobalToJson(HomeImportantForeignTrendChartGlobal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['title'] = entity.title;
	return data;
}

homeForeignStatisticsFromJson(HomeForeignStatistics data, Map<String, dynamic> json) {
	if (json['currentConfirmedCount'] != null) {
		data.currentConfirmedCount = json['currentConfirmedCount']?.toInt();
	}
	if (json['confirmedCount'] != null) {
		data.confirmedCount = json['confirmedCount']?.toInt();
	}
	if (json['suspectedCount'] != null) {
		data.suspectedCount = json['suspectedCount']?.toInt();
	}
	if (json['curedCount'] != null) {
		data.curedCount = json['curedCount']?.toInt();
	}
	if (json['deadCount'] != null) {
		data.deadCount = json['deadCount']?.toInt();
	}
	if (json['suspectedIncr'] != null) {
		data.suspectedIncr = json['suspectedIncr']?.toInt();
	}
	if (json['currentConfirmedIncr'] != null) {
		data.currentConfirmedIncr = json['currentConfirmedIncr']?.toInt();
	}
	if (json['confirmedIncr'] != null) {
		data.confirmedIncr = json['confirmedIncr']?.toInt();
	}
	if (json['curedIncr'] != null) {
		data.curedIncr = json['curedIncr']?.toInt();
	}
	if (json['deadIncr'] != null) {
		data.deadIncr = json['deadIncr']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeForeignStatisticsToJson(HomeForeignStatistics entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['suspectedCount'] = entity.suspectedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['suspectedIncr'] = entity.suspectedIncr;
	data['currentConfirmedIncr'] = entity.currentConfirmedIncr;
	data['confirmedIncr'] = entity.confirmedIncr;
	data['curedIncr'] = entity.curedIncr;
	data['deadIncr'] = entity.deadIncr;
	return data;
}

homeGlobalStatisticsFromJson(HomeGlobalStatistics data, Map<String, dynamic> json) {
	if (json['currentConfirmedCount'] != null) {
		data.currentConfirmedCount = json['currentConfirmedCount']?.toInt();
	}
	if (json['confirmedCount'] != null) {
		data.confirmedCount = json['confirmedCount']?.toInt();
	}
	if (json['curedCount'] != null) {
		data.curedCount = json['curedCount']?.toInt();
	}
	if (json['deadCount'] != null) {
		data.deadCount = json['deadCount']?.toInt();
	}
	if (json['currentConfirmedIncr'] != null) {
		data.currentConfirmedIncr = json['currentConfirmedIncr']?.toInt();
	}
	if (json['confirmedIncr'] != null) {
		data.confirmedIncr = json['confirmedIncr']?.toInt();
	}
	if (json['curedIncr'] != null) {
		data.curedIncr = json['curedIncr']?.toInt();
	}
	if (json['deadIncr'] != null) {
		data.deadIncr = json['deadIncr']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeGlobalStatisticsToJson(HomeGlobalStatistics entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['currentConfirmedIncr'] = entity.currentConfirmedIncr;
	data['confirmedIncr'] = entity.confirmedIncr;
	data['curedIncr'] = entity.curedIncr;
	data['deadIncr'] = entity.deadIncr;
	return data;
}