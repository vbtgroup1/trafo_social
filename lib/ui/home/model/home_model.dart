import 'package:travel_blog/core/base/model/base_model.dart';

class HomeModel extends BaseModel<HomeModel> {
  String category;
  String count;
  String imgurl;

  HomeModel({this.category, this.count, this.imgurl});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  HomeModel fromJson(Map<String, Object> json) {
    return HomeModel.fromJson(json);
  }
}
