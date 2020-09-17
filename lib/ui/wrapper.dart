import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_blog/core/base/model/user_model.dart';
import 'package:travel_blog/ui/auth/view/auth.dart';
import 'package:travel_blog/ui/home/view/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    // Return Home or Auth widget
    if (user == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}
