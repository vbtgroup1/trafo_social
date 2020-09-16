import 'package:flutter/material.dart';
import 'package:travel_blog/post_page/postpage.dart';

import 'ui/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostPage(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
