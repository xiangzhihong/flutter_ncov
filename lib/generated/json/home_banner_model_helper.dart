import 'package:chapter13/model/home_banner_model.dart';

homeBannerModelFromJson(HomeBannerModel data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<HomeBannerData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HomeBannerData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeBannerModelToJson(HomeBannerModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

homeBannerDataFromJson(HomeBannerData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBannerDataToJson(HomeBannerData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['image'] = entity.image;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}