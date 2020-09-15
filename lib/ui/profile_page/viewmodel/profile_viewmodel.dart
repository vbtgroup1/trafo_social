import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/model/profile_model.dart';
import 'package:travel_blog/ui/profile_page/service/IProfile_service.dart';
import 'package:travel_blog/ui/profile_page/service/profile_service.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  bool isLoading = false;
  List<ProfileModel> detailList = [];
  IProfileService detailService;

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
    await getDiscountList();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getDiscountList() async {
    detailList = await detailService.getDiscountList();
  }
}
