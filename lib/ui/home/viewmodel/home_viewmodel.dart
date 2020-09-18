import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/home/service/IHome_service.dart';
import 'package:travel_blog/ui/home/service/home_service.dart';
import 'package:travel_blog/ui/home/view/home.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

abstract class HomeViewModel extends State<Home> {
  bool isLoading = false;
  List<ProductModel> foodList = [];
  List<ProductModel> travelList = [];
  IHomeService homeService;
  UserModel user;

  @override
  void initState() {
    super.initState();
    homeService = HomeService();
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
    await getList();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getList() async {
    user = await homeService.getUserData();
  }
}
