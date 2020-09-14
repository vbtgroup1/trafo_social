import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/model/home_model.dart';
import 'package:travel_blog/ui/home/service/IHome_service.dart';
import 'package:travel_blog/ui/home/service/home_service.dart';
import 'package:travel_blog/ui/home/view/home_travel.dart';

abstract class HomeViewModelTravel extends State<HomeTravel> {
  bool isLoading = false;
  List<HomeModel> homeList = [];
  IHomeService homeService;

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
    await getDiscountList();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getDiscountList() async {
    homeList = await homeService.getDiscountList();
  }
}
