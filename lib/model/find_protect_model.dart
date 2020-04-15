/**
 * 防护知识
 */
class ProtectModel {
  String imgUrl;
  int modifyTime;
  int recordStatus;
  int createTime;
  String linkUrl;
  int id;
  int sort;
  String title;
  int contentType;
  String xOperator;

  ProtectModel({this.imgUrl, this.modifyTime, this.recordStatus, this.createTime, this.linkUrl, this.id, this.sort, this.title, this.contentType, this.xOperator});

  ProtectModel.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    modifyTime = json['modifyTime'];
    recordStatus = json['recordStatus'];
    createTime = json['createTime'];
    linkUrl = json['linkUrl'];
    id = json['id'];
    sort = json['sort'];
    title = json['title'];
    contentType = json['contentType'];
    xOperator = json['operator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['modifyTime'] = this.modifyTime;
    data['recordStatus'] = this.recordStatus;
    data['createTime'] = this.createTime;
    data['linkUrl'] = this.linkUrl;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['title'] = this.title;
    data['contentType'] = this.contentType;
    data['operator'] = this.xOperator;
    return data;
  }
}