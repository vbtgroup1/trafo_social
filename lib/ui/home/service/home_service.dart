import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

import '../../../core/base/service/base_service.dart';
import '../../../core/constants/constants.dart';
import 'IHome_service.dart';

class HomeService extends IHomeService {
  String autID = FirebaseAuth.instance.currentUser.uid;
  @override
  Future<List<ProductModel>> getFoodList() async {
    return await httpGet<ProductModel>(AppConstants.FOOD_URL, ProductModel());
  }

  @override
  Future<List<ProductModel>> getTravelList() async {
    return await httpGet<ProductModel>(AppConstants.TRAVEL_URL, ProductModel());
  }

  @override
  Future<ProfileUserModel> getUserData() async {
    return await httpGet<ProfileUserModel>(
        AppConstants.USER_URL + "/$autID.json", ProfileUserModel());
  }
}
