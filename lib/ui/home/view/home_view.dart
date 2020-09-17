import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_blog/core/base/model/error_model.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/auth/service/auth_service.dart';
import 'package:travel_blog/ui/detail/view/detail.dart';
import 'package:travel_blog/ui/home/model/product_model.dart';
import 'package:travel_blog/ui/home/viewmodel/home_viewmodel.dart';
import 'package:travel_blog/ui/maps/screen/LoadingMapCircular.dart';
import 'package:travel_blog/ui/post_page/postpage.dart';
import 'package:travel_blog/ui/profile_page/view/profile.dart';

class HomeView extends HomeViewModel {
  static const storyListLength = 1000; // Dummy
  final AuthService _auth = AuthService();
  int _index = 0;
  FutureBuilder futureBuilder;
  Future future;
  String get userPicUrl =>
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"; //shared pref profil img

  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        future = homeService.getFoodList();
        break;
      case 1:
        future = homeService.getTravelList();
        break;
    }
    return Scaffold(
      appBar: buildAppBar(userPicUrl),
      body: listFutureBuilder(future),
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
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
      title: buildTextMainTitle('Feed'),
      actions: [
        buildIconButtonSearch(),
        buildFlatButtonLogOut(),
      ],
    );
  }

  FlatButton buildFlatButtonLogOut() {
    return FlatButton.icon(
      onPressed: () async {
        await _auth.signOut();
      },
      icon: Icon(Icons.exit_to_app),
      label: Text(
        'Log out',
      ),
    );
  }

  IconButton buildIconButtonProfile(String userPicUrl) {
    return IconButton(
      icon: homeUserProfileImg(userPicUrl),
      color: Colors.black,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      },
    );
  }

  Text buildTextMainTitle(String title) {
    return Text(
      title,
      style: AppConstants.appTextStyleTitle,
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

  Container listFutureBuilder(Future future) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<ProductModel>>(
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return listView(snapshot.data);
              } else {
                final error = snapshot.error as ErrorModel;
                return Center(
                  child: Text(error.text),
                );
              }
              break;
            default:
              return Text("Something went wrong");
          }
        },
      ),
    );
  }

  ListView listView(List<ProductModel> travelList) {
    travelList.sort((a, b) => a.compareTo(b));
    return ListView.builder(
      itemCount: travelList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => homeCard(travelList[index]),
    );
  }

  Center homeCard(ProductModel travelList) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(travelList),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(travelList.sharedImg[0].url,
                      height: 180, fit: BoxFit.fill),
                ),
                homeUserContainer(
                    travelList.sharedUserProfileImg,
                    travelList.sharedUserName,
                    travelList.sharedDate,
                    travelList.sharedLat,
                    travelList.sharedLong),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeUserContainer(String userPicUrl, String userName, String shareDate,
      String lat, String long) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        homeUserProfileImg(userPicUrl),
        homeUserNameAndSharedDate(userName, shareDate),
        Spacer(),
        homeUserIconList(lat, long)
      ],
    );
  }

  Container homeUserProfileImg(String userPicUrl) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 0.13,
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
        width: MediaQuery.of(context).size.width * 0.3,
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
      style: AppConstants.appTextStyleUserName,
    );
  }

  Text homeSharedDateText(String shareDate) {
    return Text(
      shareDate,
      style: AppConstants.appTextStyleShareDate,
    );
  }

  Row homeUserIconList(String lat, String long) {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              LatLng tempLatLng = LatLng(double.parse(lat), double.parse(long));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoadingMapCircular(true, latLng: tempLatLng)));
            }),
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
