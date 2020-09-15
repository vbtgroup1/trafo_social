import 'package:travel_blog/core/base/service/base_service.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/profile_page/model/profile_model.dart';
import 'package:travel_blog/ui/profile_page/service/IProfile_service.dart';

class ProfileService extends IProfileService {
  @override
  Future<List<ProfileModel>> getDiscountList() async {
    return await httpGet<ProfileModel>(
        AppConstants.DISCOUNTLIST_URL, ProfileModel());
  }
}
