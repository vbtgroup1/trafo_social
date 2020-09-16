import 'package:flutter/material.dart';
import 'package:travel_blog/ui/login_page/logip_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
