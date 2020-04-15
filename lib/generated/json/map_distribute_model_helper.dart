import 'package:chapter13/model/map_distribute_model.dart';

mapDistributeModelFromJson(MapDistributeModel data, Map<String, dynamic> json) {
	if (json['results'] != null) {
		data.results = new List<MapDistribute>();
		(json['results'] as List).forEach((v) {
			data.results.add(new MapDistribute().fromJson(v));
		});
	}
	if (json['success'] != null) {
		data.success = json['success'];
	}
	return data;
}

Map<String, dynamic> mapDistributeModelToJson(MapDistributeModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	data['success'] = entity.success;
	return data;
}

mapDistributeResultFromJson(MapDistribute data, Map<String, dynamic> json) {
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['provinceName'] != null) {
		data.provinceName = json['provinceName']?.toString();
	}
	if (json['provinceShortName'] != null) {
		data.provinceShortName = json['provinceShortName']?.toString();
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
	if (json['cities'] != null) {
		data.cities = new List<dynamic>();
		data.cities.addAll(json['cities']);
	}
	if (json['comment'] != null) {
		data.comment = json['comment']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toInt();
	}
	if (json['modifyTime'] != null) {
		data.modifyTime = json['modifyTime']?.toInt();
	}
	return data;
}

Map<String, dynamic> mapDistributeResultToJson(MapDistribute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['country'] = entity.country;
	data['provinceName'] = entity.provinceName;
	data['provinceShortName'] = entity.provinceShortName;
	data['confirmedCount'] = entity.confirmedCount;
	data['suspectedCount'] = entity.suspectedCount;
	data['curedCount'] = entity.curedCount;
	data['deadCount'] = entity.deadCount;
	if (entity.cities != null) {
		data['cities'] =  [];
	}
	data['comment'] = entity.comment;
	data['updateTime'] = entity.updateTime;
	data['createTime'] = entity.createTime;
	data['modifyTime'] = entity.modifyTime;
	return data;
}