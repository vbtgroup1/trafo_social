import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

abstract class IHomeService {
  Future<List<ProductModel>> getFoodList();

  Future<List<ProductModel>> getTravelList();

  Future<ProfileUserModel> getUserData();
}
