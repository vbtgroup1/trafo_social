import '../../../core/base/service/base_service.dart';
import '../../../core/constants/constants.dart';
import '../model/home_model.dart';
import 'IHome_service.dart';

class HomeService extends IHomeService {
  @override
  Future<List<HomeModel>> getDiscountList() async {
    return await httpGet<HomeModel>(AppConstants.DISCOUNTLIST_URL, HomeModel());
  }
}
