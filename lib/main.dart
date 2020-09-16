import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:travel_blog/core/base/model/user_model.dart';
import 'package:travel_blog/ui/auth/service/auth_service.dart';
import 'ui/splash/splash.dart';
import 'package:flutter/services.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';
import 'package:travel_blog/ui/login_page/logip_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner: false,
        title: 'Travel Blog',
      ),
    );
  }
}
