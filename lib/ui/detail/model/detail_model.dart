import 'package:travel_blog/core/base/model/base_model.dart';

class DetailModel extends BaseModel<DetailModel> {
  String url;

  DetailModel({this.url});

  DetailModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }

  @override
  DetailModel fromJson(Map<String, Object> json) {
    return DetailModel.fromJson(json);
  }
}
