import 'package:travel_blog/ui/detail/model/detail_model.dart';

abstract class IDetailService {
  Future<List<DetailModel>> getImgList();
}
