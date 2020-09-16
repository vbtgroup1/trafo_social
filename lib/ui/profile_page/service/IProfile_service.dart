import 'package:travel_blog/ui/profile_page/model/food_model.dart';
import 'package:travel_blog/ui/profile_page/model/travel_model.dart';

abstract class IProfileService {
  Future<List<FoodModel>> getFoodList();
  Future<List<TravelModel>> getTravelList();
}
