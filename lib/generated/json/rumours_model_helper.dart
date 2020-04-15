import 'package:chapter13/model/rumours_model.dart';

rumoursModelFromJson(RumoursModel data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['newslist'] != null) {
		data.newslist = new List<RumoursNews>();
		(json['newslist'] as List).forEach((v) {
			data.newslist.add(new RumoursNews().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> rumoursModelToJson(RumoursModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.newslist != null) {
		data['newslist'] =  entity.newslist.map((v) => v.toJson()).toList();
	}
	return data;
}

rumoursNewsFromJson(RumoursNews data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['explain'] != null) {
		data.explain = json['explain']?.toString();
	}
	if (json['imgsrc'] != null) {
		data.imgsrc = json['imgsrc']?.toString();
	}
	if (json['markstyle'] != null) {
		data.markstyle = json['markstyle']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	return data;
}

Map<String, dynamic> rumoursNewsToJson(RumoursNews entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['date'] = entity.date;
	data['title'] = entity.title;
	data['explain'] = entity.explain;
	data['imgsrc'] = entity.imgsrc;
	data['markstyle'] = entity.markstyle;
	data['desc'] = entity.desc;
	data['author'] = entity.author;
	return data;
}