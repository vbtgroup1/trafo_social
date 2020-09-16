import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_blog/ui/profile_edit_page/view/editProfile.dart';
import 'package:travel_blog/ui/profile_page/model/sharedImage_model.dart';
import 'package:travel_blog/ui/profile_page/viewmodel/profile_viewmodel.dart';

class ProfileView extends ProfileViewModel {
  String view = "food";
  List<SharedImg> posts;
  int _index = 0;
  int userID = 0;
  String defaultProfileImg;
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    defaultProfileImg =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    final String travel1 =
        'https://images.unsplash.com/photo-1505578066158-8015e4136f59?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

    switch (_index) {
      case 0:
        posts = foodList[0].sharedImg;
        break;
      case 1:
        posts = travelList[0].sharedImg;
        break;
    }

    return new Stack(
      children: <Widget>[
        buildContainer(),
        buildBackgroundImage(travel1, _height),
        new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: buildAppBar(),
            backgroundColor: Colors.transparent,
            body: Container(
              child: new Column(
                children: <Widget>[
                  buildProfileImage(
                      _width, _height, userList[userID].userProfileImg),
                  buildSizedBox(_height),
                  buildNameSurnameText(userList[userID].userName, _width),
                  buildJobText(userList[userID].userJob, _width, _height),
                  buildRowButtons(),
                  buildPosts(posts, _height),
                ],
              ),
            ))
      ],
    );
  }

  Expanded buildPosts(List<SharedImg> postList, double _height) {
    return Expanded(
      child: Container(
        color: Color(0xffedf4ff),
        child: Stack(
          children: [
            buildGridView(postList),
            Center(child: buildPaddingProgress),
          ],
        ),
      ),
    );
  }

  Row buildRowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildFoodIconButton(),
        buildTravelIconButton(),
      ],
    );
  }

  GridView buildGridView(List<SharedImg> postList) {
    return GridView.count(
      shrinkWrap: true,
      primary: true,
      //scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      children: List.generate(
        postList.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Container(
              decoration: buildPostImage(postList[index].url),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration buildPostImage(String postImage) {
    return BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
        image: NetworkImage(postImage),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    );
  }

  Color isActiveButtonColor(String viewName) {
    if (view == viewName) {
      return const Color(0xff83a4d4);
    } else {
      return Colors.black26;
    }
  }

  IconButton buildFoodIconButton() {
    return IconButton(
      icon: Icon(Icons.fastfood, color: isActiveButtonColor('food')),
      onPressed: () {
        setState(() {
          view = 'food';
        });
        setState(() {
          _index = 0;
        });
      },
    );
  }

  IconButton buildTravelIconButton() {
    return IconButton(
      icon: Icon(Icons.card_travel, color: isActiveButtonColor('travel')),
      onPressed: () {
        setState(() {
          view = 'travel';
        });
        setState(() {
          _index = 1;
        });
      },
    );
  }

  CircleAvatar buildProfileImage(
      double _width, double _height, String profileImage) {
    if (profileImage == null || profileImage.isEmpty == true)
      profileImage = defaultProfileImg;
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

  Padding buildJobText(String job, double _width, double _height) {
    if (job == null) job = ' ';
    return Padding(
        padding: buildJobTextEdgeInsets(_height, _width),
        child: Text(
          job,
          style: GoogleFonts.montserrat(
            fontSize: _width / 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
  }

  SizedBox buildSizedBox(double _height) {
    return SizedBox(
      height: _height / 25.0,
    );
  }

  Text buildNameSurnameText(String nameSurname, double _width) {
    return Text(nameSurname,
        style: GoogleFonts.montserrat(
          fontSize: _width / 20,
          fontWeight: FontWeight.bold,
        ));
  }

  Image buildBackgroundImage(String travel, double _height) {
    return new Image.network(
      travel,
      height: _height * 0.51,
      fit: BoxFit.fill,
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
      actions: [
        IconButton(
          disabledColor: Colors.white,
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile()));
          },
        ),
      ],
    );
  }

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff83a4d4)),
        ),
      ),
    );
  }
}
