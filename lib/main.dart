import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';
import 'package:travel_blog/ui/login_page/logip_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

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
