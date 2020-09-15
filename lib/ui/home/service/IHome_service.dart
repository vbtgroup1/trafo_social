import 'package:travel_blog/ui/home/model/home_model.dart';

abstract class IHomeService {
  Future<List<HomeModel>> getDiscountList();
}
