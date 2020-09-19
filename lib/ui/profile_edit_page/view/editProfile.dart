import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_edit_page/view/editProfileView.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

class EditProfile extends StatefulWidget {
  EditProfile(ProfileUserModel userModel) {
    this.userModel = userModel;
  }

  ProfileUserModel userModel = ProfileUserModel();

  @override
  EditProfileView createState() => EditProfileView();
}
