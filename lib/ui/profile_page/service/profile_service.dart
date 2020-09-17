import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

import 'IProfile_service.dart';

class ProfileService extends IProfileService {
  @override
  Future<List<ProductModel>> getFoodList() async {
    return await httpGet<ProductModel>(
        "https://fb-travel-app.firebaseio.com/product/food.json",
        ProductModel());
  }

  @override
  Future<List<ProductModel>> getTravelList() async {
    return await httpGet<ProductModel>(
        "https://fb-travel-app.firebaseio.com/product/traveller.json",
        ProductModel());
  }

  /*@override
  Future<List<UserModel>> getUserList() async {
    String id = 'MHSQUM5ndkRtRxrhiiu'; //FirebaseAuth.instance.currentUser.uid;

    return await httpGet<UserModel>(
        'https://fb-travel-app.firebaseio.com/user/' + 'id' + '.json',
        UserModel());
  }*/

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
