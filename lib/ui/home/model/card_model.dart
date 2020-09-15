import 'package:travel_blog/core/base/model/base_model.dart';

class CardModel extends BaseModel<CardModel> {
  String imgUrl;
  String userPicUrl;
  String userName;
  String shareDate;
  String briefContent;

  CardModel(this.imgUrl, this.userPicUrl, this.userName, this.shareDate,
      this.briefContent);

  @override
  CardModel.fromJson(Map<String, dynamic> json) {
    imgUrl = json['image_url'];
    userPicUrl = json['user_pic_url'];
    userName = json['user_name'];
    shareDate = json['share_date'];
    briefContent = json['brief_content'];
  }

  @override
  Map<String, Object> toJson() {
    final Map<String, dynamic> json = Map<String, dynamic>();
    json['image_url'] = this.imgUrl;
    json['user_pic_url'] = this.userPicUrl;
    json['user_name'] = this.userName;
    json['share_date'] = this.shareDate;
    json['brief_content'] = this.briefContent;
    return json;
  }

  @override
  CardModel fromJson(Map<String, Object> json) {
    return CardModel.fromJson(json);
  }
}
