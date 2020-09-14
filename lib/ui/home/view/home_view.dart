import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/viewmodel/home_viewmodel.dart';
import 'package:travel_blog/core/constants/constants.dart';

class HomeView extends HomeViewModel {
  double get appBarButtonSize => MediaQuery.of(context).size.width * 0.08;
  double get appBarTitleSize => MediaQuery.of(context).size.width * 0.08;
  EdgeInsets get appBarPadding =>
      EdgeInsets.all(MediaQuery.of(context).size.width * 0.1);
  final storyList = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListViewStories(),
      bottomNavigationBar: BottomNavigationBar(items: [
        buildBottomNavigationBarItem('Food', Icons.ac_unit),
        buildBottomNavigationBarItem('Travel', Icons.ac_unit),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String text, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(text),
    );
  }

  ListView buildListViewStories() {
    return ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return homeBody();
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: buildIconButtonProfile(),
      title: buildTextMainTitle('Home Page'),
      actions: [
        buildIconButtonSearch(),
      ],
    );
  }

  IconButton buildIconButtonSearch() {
    return IconButton(
      icon: Icon(Icons.search),
      iconSize: appBarButtonSize,
      onPressed: () {},
      color: Colors.black,
    );
  }

  Text buildTextMainTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: appBarTitleSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  IconButton buildIconButtonProfile() {
    return IconButton(
      icon: homeUserProfileImg(),
      iconSize: appBarButtonSize,
      color: Colors.black,
      onPressed: () {},
    );
  }

  Padding homeBody() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.homeBodyPadding),
      child: Column(
        children: [
          homeCard(),
          homeUserContainer(),
          homeContentText(),
        ],
      ),
    );
  }

  Center homeCard() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppConstants.homeCardRadius),
            topRight: Radius.circular(AppConstants.homeCardRadius),
          ),
        ),
        margin:
            EdgeInsets.symmetric(vertical: AppConstants.homeCardVerticalMargin),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.width * 0.55,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.homeCardRadius),
              topRight: Radius.circular(AppConstants.homeCardRadius),
            ),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2018/07/26/07/45/valais-3562988_1280.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Container homeUserContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppConstants.homeUserContainerVerticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeUserProfileImg(),
          homeUserNameAndSharedDate(),
          Spacer(),
          homeUserIconList()
        ],
      ),
    );
  }

  Container homeUserProfileImg() {
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      child: ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(AppConstants.homeUserRadius)),
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6zes53m4a_2VLTcmTn_bHk8NO5SkuWfcQbg&usqp=CAU",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding homeUserNameAndSharedDate() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppConstants.homeUserNameAndSharedDatePaddingLeft),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeUserNameText(),
            homeSharedDateText(),
          ],
        ),
      ),
    );
  }

  Text homeUserNameText() {
    return Text(
      AppConstants.homeUserName,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.045),
    );
  }

  Text homeSharedDateText() {
    return Text(
      AppConstants.homeSharedDate,
      style: TextStyle(
          color: AppConstants.homeSharedDateColor,
          fontSize: MediaQuery.of(context).size.width * 0.035),
    );
  }

  Row homeUserIconList() {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.location_on), onPressed: null),
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: null)
      ],
    );
  }

  Padding homeContentText() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.homeContentTextPadding),
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
