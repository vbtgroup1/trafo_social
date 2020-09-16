import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static AppConstants _instance = AppConstants._init();
  static AppConstants get instance => _instance;
  AppConstants._init();

  ////
  static const String BASE_URL = "https://fb-travel-app.firebaseio.com";
  static const String FOOD_URL = "$BASE_URL/product/food.json";
  static const String TRAVEL_URL = "$BASE_URL/product/traveller.json";
  static const String USER_URL = "$BASE_URL/user.json";

  ///
  static const Color THEME_COLOR = Color.fromRGBO(227, 250, 252, 1);

  // Text Styles
  static final TextStyle appTextStyleTitle = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 30.0,
  );
  static final TextStyle appTextStyleUserName = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle appTextStyleShareDate = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
  static final TextStyle appTextStyleContent = GoogleFonts.montserrat(
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  //appBar
  static const Color appBarIconColor = Colors.black;
  static const Color appBartitleColor = Colors.black;
  static const double APPBAR_ICONSIZE = 20;

  //homeBodyPadding
  static const double homeBodyPadding = 10.0;

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
