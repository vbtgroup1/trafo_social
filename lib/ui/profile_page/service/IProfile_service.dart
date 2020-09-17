import 'package:travel_blog/ui/profile_page/model/model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

abstract class IProfileService {
  Future<List<BaseProfilModel>> getFoodList();

  Future<List<BaseProfilModel>> getTravelList();

  Future<List<UserModel>> getUserList();
}
