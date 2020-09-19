import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_blog/ui/auth/service/IRegisterService.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

class RegisterService extends IRegisterService {
  @override
  Future registerUserSaveData(
      ProfileUserModel model, String kullaniciId) async {
    await http.put(
        "https://fb-travel-app.firebaseio.com/userID/$kullaniciId.json",
        body: json.encode({
          'userBirth': model.userBirth,
          'userEmail': model.userEmail,
          'userGender': model.userGender,
          'userJob': model.userJob,
          'userName': model.userName,
          'userPass': model.userPass,
          'userProfileImg': model.userProfileImg
        }));
  }
}
