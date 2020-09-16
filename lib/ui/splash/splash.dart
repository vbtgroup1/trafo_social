import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_blog/ui/home/view/home.dart';
import 'package:travel_blog/ui/splash/showup.dart';
import 'package:travel_blog/ui/wrapper.dart';

void main() => runApp(Splash());

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double get verticalPadding => MediaQuery.of(context).size.height * 0.1;
  double get animationHeight => MediaQuery.of(context).size.height * 0.4;
  double get appTitleSize => 40.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: ListView(
            children: [
              Lottie.network(
                'https://assets7.lottiefiles.com/datafiles/AtGF4p7zA8LpP2R/data.json',
                height: animationHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: ShowUp(
                  child: Text(
                    "Travel Blog",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: appTitleSize, fontWeight: FontWeight.bold),
                  ),
                  delay: 2000,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
