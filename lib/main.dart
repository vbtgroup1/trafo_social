import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/view/home_food.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeFood(),
    );
  }
}
