import 'package:flutter/material.dart';
import 'package:travel_blog/ui/auth/view/register.dart';
import 'package:travel_blog/ui/auth/view/sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
  }
}
