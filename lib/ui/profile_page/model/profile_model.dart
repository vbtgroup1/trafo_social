import 'package:travel_blog/core/base/model/base_model.dart';

class ProfileModel extends BaseModel<ProfileModel> {
  String category;
  String count;
  String imgurl;

  ProfileModel({this.category, this.count, this.imgurl});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    data['imgurl'] = this.imgurl;
    return data;
  }

  @override
  ProfileModel fromJson(Map<String, Object> json) {
    return ProfileModel.fromJson(json);
  }
}
