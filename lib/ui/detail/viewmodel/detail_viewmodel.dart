import 'package:flutter/material.dart';
import 'package:travel_blog/ui/detail/model/home_model.dart';
import 'package:travel_blog/ui/detail/service/IHome_service.dart';
import 'package:travel_blog/ui/detail/service/home_service.dart';
import 'package:travel_blog/ui/detail/view/home.dart';

abstract class DetailViewModel extends State<Home> {
  bool isLoading = false;
  List<DetailModel> detailList = [];
  IDetailService detailService;

  @override
  void initState() {
    super.initState();
    detailService = DetailService();
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
