import 'package:flutter/material.dart';
import 'package:travel_blog/info_screen/info_screen1.dart';
import 'package:travel_blog/post_page/postpage.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';
import 'package:travel_blog/ProfileScreen.dart';
import 'package:travel_blog/ui/detail/view/detail.dart';
import 'package:travel_blog/ui/home/view/home.dart';

import 'ui/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
