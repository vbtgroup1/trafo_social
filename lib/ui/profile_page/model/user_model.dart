import 'package:travel_blog/core/base/model/base_model.dart';

class UserModel extends BaseModel<UserModel> {
  String userBirth;
  String userEmail;
  String userGender;
  String userJob;
  String userName;
  String userPass;
  String userProfileImg;

  UserModel(
      {this.userBirth,
      this.userEmail,
      this.userGender,
      this.userJob,
      this.userName,
      this.userPass,
      this.userProfileImg});

  UserModel.fromJson(Map<String, dynamic> json) {
    userBirth = json['userBirth'];
    userEmail = json['userEmail'];
    userGender = json['userGender'];
    userJob = json['userJob'];
    userName = json['userName'];
    userPass = json['userPass'];
    userProfileImg = json['userProfileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userBirth'] = this.userBirth;
    data['userEmail'] = this.userEmail;
    data['userGender'] = this.userGender;
    data['userJob'] = this.userJob;
    data['userName'] = this.userName;
    data['userPass'] = this.userPass;
    data['userProfileImg'] = this.userProfileImg;
    return data;
  }

  @override
  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}
