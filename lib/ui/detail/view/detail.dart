import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/model/product_model.dart';

import 'detail_view.dart';

class Detail extends StatefulWidget {
  final ProductModel homeCardModel;
  Detail(this.homeCardModel);
  @override
  DetailView createState() => DetailView(homeCardModel);
}
