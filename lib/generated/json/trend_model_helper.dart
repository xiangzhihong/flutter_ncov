import 'package:chapter13/model/trend_model.dart';

trendModelFromJson(TrendModel data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['newslist'] != null) {
		data.newslist = new List<TrendNewslist>();
		(json['newslist'] as List).forEach((v) {
			data.newslist.add(new TrendNewslist().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> trendModelToJson(TrendModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.newslist != null) {
		data['newslist'] =  entity.newslist.map((v) => v.toJson()).toList();
	}
	return data;
}

trendNewslistFromJson(TrendNewslist data, Map<String, dynamic> json) {
	if (json['modifyTime'] != null) {
		data.modifyTime = json['modifyTime']?.toInt();
	}
	if (json['continents'] != null) {
		data.continents = json['continents']?.toString();
	}
	if (json['provinceName'] != null) {
		data.provinceName = json['provinceName']?.toString();
	}
	if (json['currentConfirmedCount'] != null) {
		data.currentConfirmedCount = json['currentConfirmedCount']?.toInt();
	}
	if (json['confirmedCount'] != null) {
		data.confirmedCount = json['confirmedCount']?.toInt();
	}
	if (json['confirmedCountRank'] != null) {
		data.confirmedCountRank = json['confirmedCountRank']?.toInt();
	}
	if (json['curedCount'] != null) {
		data.curedCount = json['curedCount']?.toInt();
	}
	if (json['deadCount'] != null) {
		data.deadCount = json['deadCount']?.toInt();
	}
	if (json['deadCountRank'] != null) {
		data.deadCountRank = json['deadCountRank']?.toInt();
	}
	if (json['deadRate'] != null) {
		data.deadRate = json['deadRate']?.toString();
	}
	if (json['deadRateRank'] != null) {
		data.deadRateRank = json['deadRateRank']?.toInt();
	}
	if (json['locationId'] != null) {
		data.locationId = json['locationId']?.toInt();
	}
	if (json['countryShortCode'] != null) {
		data.countryShortCode = json['countryShortCode']?.toString();
	}
	return data;
}

Map<String, dynamic> trendNewslistToJson(TrendNewslist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['modifyTime'] = entity.modifyTime;
	data['continents'] = entity.continents;
	data['provinceName'] = entity.provinceName;
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['confirmedCountRank'] = entity.confirmedCountRank;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['deadCountRank'] = entity.deadCountRank;
	data['deadRate'] = entity.deadRate;
	data['deadRateRank'] = entity.deadRateRank;
	data['locationId'] = entity.locationId;
	data['countryShortCode'] = entity.countryShortCode;
	return data;
}