import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_blog/ui/profile_edit_page/service/IHttpProfileService.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

class HttpProfileService extends IHttpProfileService {
  @override
  Future postUserInfo(UserModel model, String kullaniciId) async {
    await http.put(
        "https://fb-travel-app.firebaseio.com/user/$kullaniciId.json",
        body: json.encode({
          'userBirth': model.userBirth,
          'userEmail': model.userEmail,
          'userGender': model.userGender,
          'userJob': model.userJob,
          'userName': model.userName,
          'userProfileImg': model.userProfileImg
        }));
  }
}
