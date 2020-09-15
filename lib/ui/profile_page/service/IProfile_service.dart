import 'package:travel_blog/ui/profile_page/model/profile_model.dart';

abstract class IProfileService {
  Future<List<ProfileModel>> getDiscountList();
}
