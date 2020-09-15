import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/home/model/home_model.dart';

import 'IHome_service.dart';

class HomeService extends IHomeService {
  @override
  Future<List<HomeModel>> getDiscountList() async {
    return await httpGet<HomeModel>(AppConstants.DISCOUNTLIST_URL, HomeModel());
  }
}
