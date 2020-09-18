import 'package:travel_blog/ui/home/model/product_model.dart';

abstract class IHomeService {
  Future<List<ProductModel>> getFoodList();
  Future<List<ProductModel>> getTravelList();
  Future getUserData();
}
