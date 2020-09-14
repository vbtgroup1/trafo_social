import 'package:travel_blog/ui/detail/model/home_model.dart';

abstract class IDetailService {
  Future<List<DetailModel>> getDiscountList();
}
