import 'package:chapter13/model/find_wiki_model.dart';

findWikiModelFromJson(FindWikiModel data, Map<String, dynamic> json) {
	if (json['pageNum'] != null) {
		data.pageNum = json['pageNum']?.toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['result'] != null) {
		data.result = new List<FindWikiResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new FindWikiResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> findWikiModelToJson(FindWikiModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pageNum'] = entity.pageNum;
	data['pageSize'] = entity.pageSize;
	data['total'] = entity.total;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

findWikiResultFromJson(FindWikiResult data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['sort'] != null) {
		data.sort = json['sort']?.toInt();
	}
	return data;
}

Map<String, dynamic> findWikiResultToJson(FindWikiResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['imgUrl'] = entity.imgUrl;
	data['linkUrl'] = entity.linkUrl;
	data['description'] = entity.description;
	data['sort'] = entity.sort;
	return data;
}