import 'package:flutter/material.dart';
import 'package:travel_blog/ui/detail/viewmodel/detail_viewmodel.dart';

class DetailView extends DetailViewModel {
//app Bar
  double get appBarButtonSize => MediaQuery.of(context).size.width * 0.08;
  double get appBarTitleSize => MediaQuery.of(context).size.width * 0.08;
  Color get appBarIconColor => Colors.black;
  Color get appBartitleColor => Colors.black;
  String get appBarTitleText => "Detail Page";

  //detailBodyPadding
  double get detailBodyPadding => 8.0;

  //detailCard
  double get detailCardSizeWidth => MediaQuery.of(context).size.width * 1;
  double get detailCardSizeHeight => MediaQuery.of(context).size.width * 0.55;
  double get detailCardRadius => 20.0;
  double get detailCardVerticalMargin => 8.0;

  //detailUser
  double get detailUserProfileImgHeight =>
      MediaQuery.of(context).size.width * 0.15;
  double get detailUserContainerVerticalMargin => 4.0;
  double get detailUserRadius => 30.0;

  //detailUserNameAndSharedDate
  double get detailUserNameAndSharedDateWidth =>
      MediaQuery.of(context).size.width * 0.35;
  double get detailUserNameAndSharedDatePaddingLeft => 10.0;
  double get detailUserNameTextSize =>
      MediaQuery.of(context).size.width * 0.045;
  double get detailSharedDateTextSize =>
      MediaQuery.of(context).size.width * 0.035;
  String get detailUserName => "Grant Marshall";
  String get detailSharedDate => "January 9,2020";
  Color get detailSharedDateColor => Colors.grey[400];

  //detailContentText
  double get detailContentTextPadding => 8.0;

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
          appBarTitleText,
          style: TextStyle(
              color: appBartitleColor,
              fontWeight: FontWeight.bold,
              fontSize: appBarTitleSize),
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
            color: appBarIconColor, size: appBarButtonSize),
        onPressed: () => Navigator.of(context).pop(null));
  }

  Padding detailBody() {
    return Padding(
      padding: EdgeInsets.all(detailBodyPadding),
      child: Column(
        children: [
          detailCard(),
          detailUserContainer(),
          detailContentText(),
        ],
      ),
    );
  }

  Center detailCard() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(detailCardRadius),
            topRight: Radius.circular(detailCardRadius),
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: detailCardVerticalMargin),
        child: Container(
          width: detailCardSizeWidth,
          height: detailCardSizeHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(detailCardRadius),
              topRight: Radius.circular(detailCardRadius),
            ),
            child: Image.network(
              "https://lh3.googleusercontent.com/proxy/3WB5Vi-1ZX00DpguJEhxYKws78G_RXBFnhPKbNgg_iZ0Rosfz3FIX-qqzD6i65PEql5BFCTiJvzGPdIkTOUqxCdcZ85XqA5ov-wZ8rhmSOT5",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Container detailUserContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: detailUserContainerVerticalMargin),
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
        borderRadius: BorderRadius.all(Radius.circular(detailUserRadius)),
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6zes53m4a_2VLTcmTn_bHk8NO5SkuWfcQbg&usqp=CAU",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding detailUserNameAndSharedDate() {
    return Padding(
      padding: EdgeInsets.only(left: detailUserNameAndSharedDatePaddingLeft),
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
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: detailUserNameTextSize),
    );
  }

  Text detailSharedDateText() {
    return Text(
      detailSharedDate,
      style: TextStyle(
          color: detailSharedDateColor, fontSize: detailSharedDateTextSize),
    );
  }

  Row detailUserIconList() {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.location_on), onPressed: null),
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: null)
      ],
    );
  }

  Padding detailContentText() {
    return Padding(
      padding: EdgeInsets.all(detailContentTextPadding),
      child: Column(
        children: [
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
