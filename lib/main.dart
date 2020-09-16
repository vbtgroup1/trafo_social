import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_edit_page/view/editProfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
