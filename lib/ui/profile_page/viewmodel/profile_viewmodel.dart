import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/model/product_model.dart';
import 'package:travel_blog/ui/profile_page/model/profile_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';
import 'package:travel_blog/ui/profile_page/service/IProfile_service.dart';
import 'package:travel_blog/ui/profile_page/service/profile_service.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  bool isLoading = false;
  final List<ProfileModel> detailList = [];
  List<ProductModel> foodList = [];
  List<ProductModel> travelList = [];
  List<UserModel> userList = [];
  List<ProductModel> tempFoodList = [];
  List<ProductModel> tempTravelList = [];
  IProfileService detailService;
  List<ProductModel> posts = [];
  int index = 0;
  bool isCompleted = false;
  int userID = 1;

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

    for (int i = 0; i < foodList.length; ++i) {
      if (foodList[i].sharedUserId == userID.toString()) {
        tempFoodList.add(foodList[i]);
      }
    }
    for (int i = 0; i < travelList.length; ++i) {
      if (travelList[i].sharedUserId == userID.toString()) {
        tempTravelList.add(travelList[i]);
      }
    }
    posts = (index == 0 ? tempFoodList : tempTravelList);
    isCompleted = true;
  }
}
