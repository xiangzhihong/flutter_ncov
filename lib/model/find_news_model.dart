
/**
 * 时间新闻
 */
class NewsModel {

	String summary;
	String sourceUrl;
	int modifyTime;
	int createTime;
	int id;
	String provinceName;
	String title;
	int pubDate;
	String pubDateStr;
	String provinceId;
	String infoSource;

	NewsModel({
		this.summary,
		this.sourceUrl,
		this.modifyTime,
		this.createTime,
		this.id,
		this.provinceName,
		this.title,
		this.pubDate,
		this.pubDateStr,
		this.provinceId,
		this.infoSource,
	});

	NewsModel.fromJson(Map<String, dynamic> json) {
		summary = json['summary'];
		sourceUrl = json['sourceUrl'];
		modifyTime = json['modifyTime'];
		createTime = json['createTime'];
		id = json['id'];
		provinceName = json['provinceName'];
		title = json['title'];
		pubDate = json['pubDate'];
		pubDateStr = json['pubDateStr'];
		provinceId = json['provinceId'];
		infoSource = json['infoSource'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['summary'] = this.summary;
		data['sourceUrl'] = this.sourceUrl;
		data['modifyTime'] = this.modifyTime;
		data['createTime'] = this.createTime;
		data['id'] = this.id;
		data['provinceName'] = this.provinceName;
		data['title'] = this.title;
		data['pubDate'] = this.pubDate;
		data['pubDateStr'] = this.pubDateStr;
		data['provinceId'] = this.provinceId;
		data['infoSource'] = this.infoSource;
		return data;
	}

}
