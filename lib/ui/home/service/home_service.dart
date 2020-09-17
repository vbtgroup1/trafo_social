import 'package:travel_blog/ui/home/model/product_model.dart';

import '../../../core/base/service/base_service.dart';
import '../../../core/constants/constants.dart';
import 'IHome_service.dart';

class HomeService extends IHomeService {
  @override
  Future<List<ProductModel>> getFoodList() async {
    return await httpGet<ProductModel>(AppConstants.FOOD_URL, ProductModel());
  }

  @override
  Future<List<ProductModel>> getTravelList() async {
    return await httpGet<ProductModel>(AppConstants.TRAVEL_URL, ProductModel());
  }
}
