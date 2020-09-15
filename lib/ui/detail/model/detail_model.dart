import 'package:travel_blog/core/base/model/base_model.dart';

class DetailModel extends BaseModel<DetailModel> {
  String category;
  String count;
  String imgurl;

  DetailModel({this.category, this.count, this.imgurl});

  DetailModel.fromJson(Map<String, dynamic> json) {
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
  DetailModel fromJson(Map<String, Object> json) {
    return DetailModel.fromJson(json);
  }
}
