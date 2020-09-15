import 'package:flutter/material.dart';
import 'package:travel_blog/ui/home/model/card_model.dart';
import 'package:travel_blog/ui/home/viewmodel/home_viewmodel.dart';
import 'package:travel_blog/core/constants/constants.dart';

class HomeView extends HomeViewModel {
  static const storyListLength = 1000; // Dummy
  CardModel dummyCardTravel = CardModel(
      "https://cdn.pixabay.com/photo/2018/07/26/07/45/valais-3562988_1280.jpg",
      "https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397_960_720.png",
      "Grant Marshall",
      "January 9,2020",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  CardModel dummyCardFood = CardModel(
      "https://cdn.pixabay.com/photo/2018/07/26/07/45/valais-3562988_1280.jpg",
      "https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397_960_720.png",
      "Grant Marshall",
      "January 9,2020",
      "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...");
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    CardModel card;
    switch (_index) {
      case 0:
        card = dummyCardFood;
        break;
      case 1:
        card = dummyCardTravel;
        break;
    }
    return Scaffold(
      appBar: buildAppBar(card.userPicUrl),
      body: buildListViewStories(card),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: [
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

  AppBar buildAppBar(String userPicUrl) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: buildIconButtonProfile(userPicUrl),
      title: buildTextMainTitle('Home Page'),
      actions: [
        buildIconButtonSearch(),
      ],
    );
  }

  IconButton buildIconButtonProfile(String userPicUrl) {
    return IconButton(
      icon: homeUserProfileImg(userPicUrl),
      iconSize: MediaQuery.of(context).size.width * 0.08,
      color: Colors.black,
      onPressed: () {},
    );
  }

  Text buildTextMainTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.08,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  IconButton buildIconButtonSearch() {
    return IconButton(
      icon: Icon(Icons.search),
      iconSize: MediaQuery.of(context).size.width * 0.08,
      onPressed: () {},
      color: Colors.black,
    );
  }

  ListView buildListViewStories(CardModel card) {
    return ListView.builder(
        itemCount: storyListLength,
        itemBuilder: (context, index) {
          return homeBody(card);
        });
  }

  Widget homeBody(CardModel card) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.homeBodyPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.homeCardRadius),
          ),
        ),
        child: Column(
          children: [
            homeCard(card.imgUrl),
            homeUserContainer(
              card.userPicUrl,
              card.userName,
              card.shareDate,
            ),
            homeContentText(card.briefContent),
          ],
        ),
      ),
    );
  }

  Center homeCard(String imgUrl) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.homeCardRadius),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.width * 0.55,
          child: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstants.homeCardRadius)),
            child: Image.network(imgUrl, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Container homeUserContainer(
      String userPicUrl, String userName, String shareDate) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppConstants.homeUserContainerVerticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeUserProfileImg(userPicUrl),
          homeUserNameAndSharedDate(userName, shareDate),
          Spacer(),
          homeUserIconList()
        ],
      ),
    );
  }

  Container homeUserProfileImg(String userPicUrl) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      child: ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(AppConstants.homeUserRadius)),
        child: Image.network(
          userPicUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding homeUserNameAndSharedDate(String userName, String shareDate) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppConstants.homeUserNameAndSharedDatePaddingLeft),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeUserNameText(userName),
            homeSharedDateText(shareDate),
          ],
        ),
      ),
    );
  }

  Text homeUserNameText(String userName) {
    return Text(
      userName,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.045),
    );
  }

  Text homeSharedDateText(String shareDate) {
    return Text(
      shareDate,
      style: TextStyle(
          color: AppConstants.homeSharedDateColor,
          fontSize: MediaQuery.of(context).size.width * 0.035),
    );
  }

  Row homeUserIconList() {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.location_on), onPressed: () {}),
        IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {})
      ],
    );
  }

  Padding homeContentText(String content) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.homeContentTextPadding),
      child: Column(
        children: [
          Text(content, textAlign: TextAlign.justify),
        ],
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
}
