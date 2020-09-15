import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/detail/model/detail_model.dart';

import 'IDetail_service.dart';

class DetailService extends IDetailService {
  @override
  Future<List<DetailModel>> getDiscountList() async {
    return await httpGet<DetailModel>(
        AppConstants.DISCOUNTLIST_URL, DetailModel());
  }
}
