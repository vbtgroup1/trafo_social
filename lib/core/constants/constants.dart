import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants _instance = AppConstants._init();
  static AppConstants get instance => _instance;
  AppConstants._init();

  static const String BASE_URL = "https://fb-wash-app.firebaseio.com";
  static const String DISCOUNTLIST_URL = "$BASE_URL/home/discountlist.json";

  static const Color appBarIconColor = Colors.black;
  static const Color appBartitleColor = Colors.black;

  //homeBodyPadding
  static const double homeBodyPadding = 15;

  //homeCard
  static const double homeCardRadius = 20.0;
  static const double homeCardVerticalMargin = 5.0;

  //homeUser
  static const double homeUserContainerVerticalMargin = 4.0;
  static const double homeUserRadius = 30.0;

  //homeUserNameAndSharedDate
  static const double homeUserNameAndSharedDatePaddingLeft = 10.0;
  static final Color homeSharedDateColor = Colors.grey[400];

  //homeContentText
  static const double homeContentTextPadding = 8.0;

  //detailBodyPadding
  static const double detailBodyPadding = 8.0;

  //detailCard
  static const double detailCardRadius = 20.0;
  static const double detailCardVerticalMargin = 8.0;

  //detailUser
  static const double detailUserContainerVerticalMargin = 4.0;
  static const double detailUserRadius = 30.0;

  //detailUserNameAndSharedDate
  static const double detailUserNameAndSharedDatePaddingLeft = 10.0;
  static final Color detailSharedDateColor = Colors.grey[400];

  //detailContentText
  static const double detailContentTextPadding = 8.0;
}
