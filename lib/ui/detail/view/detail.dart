import 'package:flutter/material.dart';
import 'package:travel_blog/core/base/model/base_model.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';

import 'detail_view.dart';

class Detail extends StatefulWidget {
  final BaseModel homeCardModel;

  Detail(this.homeCardModel);

  @override
  DetailView createState() => DetailView(homeCardModel as ProductModel);
}
