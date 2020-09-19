import 'package:travel_blog/ui/post_page/model/PostModel.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

abstract class IHttpSharePost {
  Future postData(PostModel model, bool isFoodSelected);

  Future<ProfileUserModel> getPostUserModel(String uid);
}
