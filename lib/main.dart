import 'package:flutter/material.dart';
import 'package:travel_blog/ProfileScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(child: ProfileScreen()),
      ),
    );
  }
}
