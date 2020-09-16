import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/model/food_model.dart';
import 'package:travel_blog/ui/profile_page/model/profile_model.dart';
import 'package:travel_blog/ui/profile_page/model/sharedImage_model.dart';
import 'package:travel_blog/ui/profile_page/model/travel_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';
import 'package:travel_blog/ui/profile_page/service/IProfile_service.dart';
import 'package:travel_blog/ui/profile_page/service/profile_service.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  bool isLoading = false;
  final List<ProfileModel> detailList = [];
  List<FoodModel> foodList = [];
  List<TravelModel> travelList = [];
  List<UserModel> userList = [];
  IProfileService detailService;

  List<SharedImg> posts = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    detailService = ProfileService();
    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await getLists();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (foodList.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getLists() async {
    foodList = await detailService.getFoodList();
    travelList = await detailService.getTravelList();
    userList = await detailService.getUserList();
    posts = index == 0 ? foodList.first.sharedImg : travelList.first.sharedImg;
  }
}
