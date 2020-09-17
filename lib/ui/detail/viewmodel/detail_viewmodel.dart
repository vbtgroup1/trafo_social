import 'package:flutter/material.dart';
import 'package:travel_blog/ui/detail/model/detail_model.dart';
import 'package:travel_blog/ui/detail/service/IDetail_service.dart';
import 'package:travel_blog/ui/detail/service/detail_service.dart';
import 'package:travel_blog/ui/detail/view/detail.dart';

abstract class DetailViewModel extends State<Detail> {
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
    await getImgList();
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getImgList() async {
    detailList = await detailService.getImgList();
  }
}
