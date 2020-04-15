import 'package:chapter13/generated/json/base/json_convert_content.dart';

/**
 * 辟谣
 */
class HomeRumourModel with JsonConvert<HomeRumourModel> {

	int id;
	String title;
	String mainSummary;
	String summary;
	String body;
	String sourceUrl;
	int score;
	int rumorType;
	bool isOpen;


	HomeRumourModel({
		this.summary,
		this.sourceUrl,
		this.score,
		this.rumorType,
		this.id,
		this.mainSummary,
		this.title,
		this.body,
		this.isOpen = false,
	});

	HomeRumourModel.fromJson(Map<String, dynamic> json) {
		summary = json['summary'];
		sourceUrl = json['sourceUrl'];
		score = json['score'];
		rumorType = json['rumorType'];
		id = json['id'];
		mainSummary = json['mainSummary'];
		title = json['title'];
		body = json['body'];
		isOpen = false;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['summary'] = this.summary;
		data['sourceUrl'] = this.sourceUrl;
		data['score'] = this.score;
		data['rumorType'] = this.rumorType;
		data['id'] = this.id;
		data['mainSummary'] = this.mainSummary;
		data['title'] = this.title;
		data['body'] = this.body;
		return data;
	}
}
