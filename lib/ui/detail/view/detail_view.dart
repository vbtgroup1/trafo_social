import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/detail/model/detail_constants.dart';
import 'package:travel_blog/ui/detail/viewmodel/detail_viewmodel.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/maps/screen/LoadingMapCircular.dart';

class DetailView extends DetailViewModel {
  final ProductModel homeProductModel;
  DetailView(this.homeProductModel);

  double get appBarButtonSize => MediaQuery.of(context).size.width * 0.08;
  double get detailCardSizeWidth => MediaQuery.of(context).size.width * 0.9;
  double get detailCardSizeHeight => MediaQuery.of(context).size.width * 0.55;
  double get detailUserProfileImgHeight =>
      MediaQuery.of(context).size.width * 0.15;
  double get detailUserNameAndSharedDateWidth =>
      MediaQuery.of(context).size.width * 0.35;
  double get detailUserNameTextSize =>
      MediaQuery.of(context).size.width * 0.045;
  double get detailSharedDateTextSize =>
      MediaQuery.of(context).size.width * 0.035;

  String get detailUserName => homeProductModel.sharedUserName;
  String get detailSharedDate => homeProductModel.sharedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(child: detailBody()),
    );
  }

  AppBar appBar() {
    return AppBar(
        title: Text(
          DetailConstants.instance.appBarTitleText,
          style: AppConstants.appTextStyleTitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        leading: appBarLeftIcon(context));
  }

  IconButton appBarLeftIcon(context) {
    return IconButton(
        icon: new Icon(Icons.arrow_back,
            color: DetailConstants.instance.appBarIconColor,
            size: appBarButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  Padding detailBody() {
    return Padding(
      padding: EdgeInsets.all(DetailConstants.instance.detailBodyPadding),
      child: Column(
        children: [
          imgListView(homeProductModel),
          detailUserContainer(),
          detailContentText(),
        ],
      ),
    );
  }

  Container imgListView(ProductModel productModel) {
    return Container(
      height: detailCardSizeHeight,
      child: ListView.builder(
        itemCount: productModel.sharedImg.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            detailCard(productModel.sharedImg[index].url),
      ),
    );
  }

  Center detailCard(String url) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DetailConstants.instance.detailCardRadius),
            topRight:
                Radius.circular(DetailConstants.instance.detailCardRadius),
          ),
        ),
        margin: EdgeInsets.symmetric(
            vertical: DetailConstants.instance.detailCardVerticalMargin,
            horizontal: DetailConstants.instance.detailCardHorizonalMargin),
        child: Container(
          width: detailCardSizeWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(DetailConstants.instance.detailCardRadius),
              topRight:
                  Radius.circular(DetailConstants.instance.detailCardRadius),
            ),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Container detailUserContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: DetailConstants.instance.detailUserContainerVerticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          detailUserProfileImg(),
          detailUserNameAndSharedDate(),
          Spacer(),
          detailUserIconList()
        ],
      ),
    );
  }

  Container detailUserProfileImg() {
    return Container(
      height: detailUserProfileImgHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(DetailConstants.instance.detailUserRadius)),
        child: Image.network(
          homeProductModel.sharedUserProfileImg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding detailUserNameAndSharedDate() {
    return Padding(
      padding: EdgeInsets.only(
          left:
              DetailConstants.instance.detailUserNameAndSharedDatePaddingLeft),
      child: Container(
        width: detailUserNameAndSharedDateWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailUserNameText(),
            detailSharedDateText(),
          ],
        ),
      ),
    );
  }

  Text detailUserNameText() {
    return Text(
      detailUserName,
      style: AppConstants.appTextStyleUserName,
    );
  }

  Text detailSharedDateText() {
    return Text(
      detailSharedDate,
      style: AppConstants.appTextStyleShareDate,
    );
  }

  Row detailUserIconList() {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              double lat = double.parse(homeProductModel.sharedLat);
              double long = double.parse(homeProductModel.sharedLong);
              LatLng tempLatLng = LatLng(lat, long);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoadingMapCircular(true, latLng: tempLatLng)));
            }),
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: null)
      ],
    );
  }

  Padding detailContentText() {
    return Padding(
      padding:
          EdgeInsets.all(DetailConstants.instance.detailContentTextPadding),
      child: Column(
        children: [
          Text(
            homeProductModel.sharedText,
            textAlign: TextAlign.justify,
            style: AppConstants.appTextStyleContent,
          ),
        ],
      ),
    );
  }
}
