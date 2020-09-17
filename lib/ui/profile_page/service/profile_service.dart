import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/ui/profile_page/model/model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

import 'IProfile_service.dart';

class ProfileService extends IProfileService {
  @override
  Future<List<BaseProfilModel>> getFoodList() async {
    return await httpGet<BaseProfilModel>(
        "https://fb-travel-app.firebaseio.com/product/food.json",
        BaseProfilModel());
  }

  @override
  Future<List<BaseProfilModel>> getTravelList() async {
    return await httpGet<BaseProfilModel>(
        "https://fb-travel-app.firebaseio.com/product/traveller.json",
        BaseProfilModel());
  }

  @override
  Future<List<UserModel>> getUserList() async {
    return await httpGet<UserModel>(
        "https://fb-travel-app.firebaseio.com/user.json", UserModel());
  }
}
