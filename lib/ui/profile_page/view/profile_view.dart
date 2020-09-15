import 'package:flutter/material.dart';
import 'package:travel_blog/ui/profile_page/viewmodel/profile_viewmodel.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    final String travel = 'https://gokovali.com/images/2018/06/06/azmak.jpg';
    final String foodIcon =
        'https://cdn4.vectorstock.com/i/1000x1000/85/18/charity-food-icon-in-flat-style-on-white-vector-27938518.jpg';
    final String travelIcon =
        'https://image.shutterstock.com/image-vector/suitcase-icon-travel-logo-600w-1373542559.jpg';
    final String travell =
        'https://media-cdn.tripadvisor.com/media/photo-s/09/51/c7/db/the-forest-camp.jpg';
    return new Stack(
      children: <Widget>[
        buildContainer(),
        buildBackgroundImage(travel),
        new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: buildAppBar(),
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Column(
                children: <Widget>[
                  buildProfileImage(_width, _height, imgUrl),
                  buildSizedBox(_height),
                  buildNameSurnameText('Eric Ferkyd', _width),
                  Padding(
                    padding: buildJobTextEdgeInsets(_height, _width),
                    child: buildJobText('Computer Engineer', _width),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildIconButton(foodIcon),
                      buildIconButton(travelIcon),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: buildGridView(travell),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  GridView buildGridView(String postImage) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      shrinkWrap: true,
      children: List.generate(
        10,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: buildPostImage(postImage),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration buildPostImage(String PostImage) {
    return BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
        image: NetworkImage(PostImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    );
  }

  IconButton buildIconButton(String foodIcon) {
    return IconButton(
      icon: Image.network(
        foodIcon,
      ),
      onPressed: () {},
    );
  }

  CircleAvatar buildProfileImage(
      double _width, double _height, String profileImage) {
    return CircleAvatar(
      radius: _width < _height ? _width / 4 : _height / 4,
      backgroundImage: NetworkImage(profileImage),
    );
  }

  EdgeInsets buildJobTextEdgeInsets(double _height, double _width) {
    return EdgeInsets.only(
        top: _height / 90,
        left: _width / 8,
        right: _width / 8,
        bottom: _height / 30);
  }

  Text buildJobText(String job, double _width) {
    return Text(
      job,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: _width / 25,
          color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  SizedBox buildSizedBox(double _height) {
    return SizedBox(
      height: _height / 25.0,
    );
  }

  Text buildNameSurnameText(String nameSurname, double _width) {
    return Text(
      nameSurname,
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: _width / 15,
          color: Colors.white),
    );
  }

  Image buildBackgroundImage(String travel) {
    return new Image.network(
      travel,
      fit: BoxFit.cover,
    );
  }

  Container buildContainer() {
    return new Container(
      color: Colors.white,
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        disabledColor: Colors.black,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }
}
