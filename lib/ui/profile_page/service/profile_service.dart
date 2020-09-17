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

  @override
  Future<UserModel> getUserModel(String uid) async {
    return await httpGet(
        "https://fb-travel-app.firebaseio.com/userID/$uid.json", UserModel());
  }
}
