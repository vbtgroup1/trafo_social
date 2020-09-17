import 'package:flutter/material.dart';

class DetailConstants {
  static DetailConstants _instance = DetailConstants._init();
  static DetailConstants get instance => _instance;
  DetailConstants._init();

  //app Bar
  Color get appBarIconColor => Colors.black;
  String get appBarTitleText => "Detail Page";

  //detailBodyPadding
  double get detailBodyPadding => 8.0;

  //detailCard
  double get detailCardRadius => 20.0;
  double get detailCardVerticalMargin => 8.0;
  double get detailCardHorizonalMargin => 5.0;

  //detailUser
  double get detailUserContainerVerticalMargin => 4.0;

  double get detailUserRadius => 30.0;

  //detailUserNameAndSharedDate

  double get detailUserNameAndSharedDatePaddingLeft => 10.0;

  Color get detailSharedDateColor => Colors.grey[400];

  //detailContentText
  double get detailContentTextPadding => 8.0;
}
