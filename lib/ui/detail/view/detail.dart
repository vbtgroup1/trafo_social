import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/model/card_model.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'detail_view.dart';

class Detail extends StatefulWidget {
  final ProductModel homeProductModel;
  Detail(this.homeProductModel);
  @override
  DetailView createState() => DetailView(homeProductModel);
}
