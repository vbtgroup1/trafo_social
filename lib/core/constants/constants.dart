class AppConstants {
  static AppConstants _instance = AppConstants._init();
  static AppConstants get instance => _instance;
  AppConstants._init();

  static const String BASE_URL = "https://fb-wash-app.firebaseio.com";
  static const String DISCOUNTLIST_URL = "$BASE_URL/home/discountlist.json";
}
