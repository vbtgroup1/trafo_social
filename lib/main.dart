import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';
import 'package:travel_blog/ProfileScreen.dart';
import 'package:travel_blog/ui/detail/view/detail.dart';
import 'package:travel_blog/ui/home/view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}
