import 'package:flutter/material.dart';
import 'package:travel_blog/info_screen/info_screen1.dart';
import 'package:travel_blog/post_page/postpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PostPage(),
    );
  }
}
