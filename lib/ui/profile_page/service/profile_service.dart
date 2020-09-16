import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/profile_page/model/food_model.dart';
import 'package:travel_blog/ui/profile_page/model/travel_model.dart';

import 'IProfile_service.dart';

class ProfileService extends IProfileService {
  @override
  Future<List<FoodModel>> getFoodList() async {
    return await httpGet<FoodModel>(AppConstants.FOOD_URL, FoodModel());
  }

  @override
  Future<List<TravelModel>> getTravelList() async {
    return await httpGet<TravelModel>(AppConstants.TRAVEL_URL, TravelModel());
  }
}
