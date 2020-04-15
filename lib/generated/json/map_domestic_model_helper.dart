import 'package:chapter13/model/map_domestic_model.dart';

mapDomesticModelFromJson(MapDomesticModel data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['newslist'] != null) {
		data.newslist = new List<MapDomesticNewslist>();
		(json['newslist'] as List).forEach((v) {
			data.newslist.add(new MapDomesticNewslist().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> mapDomesticModelToJson(MapDomesticModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.newslist != null) {
		data['newslist'] =  entity.newslist.map((v) => v.toJson()).toList();
	}
	return data;
}

mapDomesticNewslistFromJson(MapDomesticNewslist data, Map<String, dynamic> json) {
	if (json['provinceName'] != null) {
		data.provinceName = json['provinceName']?.toString();
	}
	if (json['provinceShortName'] != null) {
		data.provinceShortName = json['provinceShortName']?.toString();
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
	if (json['comment'] != null) {
		data.comment = json['comment']?.toString();
	}
	if (json['locationId'] != null) {
		data.locationId = json['locationId']?.toInt();
	}
	if (json['cities'] != null) {
		data.cities = new List<MapDomesticNewslistCity>();
		(json['cities'] as List).forEach((v) {
			data.cities.add(new MapDomesticNewslistCity().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> mapDomesticNewslistToJson(MapDomesticNewslist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['provinceName'] = entity.provinceName;
	data['provinceShortName'] = entity.provinceShortName;
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['suspectedCount'] = entity.suspectedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['comment'] = entity.comment;
	data['locationId'] = entity.locationId;
	if (entity.cities != null) {
		data['cities'] =  entity.cities.map((v) => v.toJson()).toList();
	}
	return data;
}

mapDomesticNewslistCityFromJson(MapDomesticNewslistCity data, Map<String, dynamic> json) {
	if (json['cityName'] != null) {
		data.cityName = json['cityName']?.toString();
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
	if (json['locationId'] != null) {
		data.locationId = json['locationId']?.toInt();
	}
	return data;
}

Map<String, dynamic> mapDomesticNewslistCityToJson(MapDomesticNewslistCity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cityName'] = entity.cityName;
	data['currentConfirmedCount'] = entity.currentConfirmedCount;
	data['confirmedCount'] = entity.confirmedCount;
	data['suspectedCount'] = entity.suspectedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	data['locationId'] = entity.locationId;
	return data;
}