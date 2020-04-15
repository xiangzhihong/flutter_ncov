import 'package:chapter13/model/home_rumour_model.dart';

homeRumourModelFromJson(HomeRumourModel data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['mainSummary'] != null) {
		data.mainSummary = json['mainSummary']?.toString();
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['body'] != null) {
		data.body = json['body']?.toString();
	}
	if (json['sourceUrl'] != null) {
		data.sourceUrl = json['sourceUrl']?.toString();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['rumorType'] != null) {
		data.rumorType = json['rumorType']?.toInt();
	}
	if (json['isOpen'] != null) {
		data.isOpen = json['isOpen'];
	}
	return data;
}

Map<String, dynamic> homeRumourModelToJson(HomeRumourModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['mainSummary'] = entity.mainSummary;
	data['summary'] = entity.summary;
	data['body'] = entity.body;
	data['sourceUrl'] = entity.sourceUrl;
	data['score'] = entity.score;
	data['rumorType'] = entity.rumorType;
	data['isOpen'] = entity.isOpen;
	return data;
}