import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditingData = false;
  bool buttonIsVisible = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageRadius = width * 30 / 100;
    double topBarHeight = height * 14 / 100;
    double topBottomPadding = height * 4 / 100;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isEditingData
              ? editingTopBar(topBarHeight)
              : noneditingTopBar(topBarHeight),
          SizedBox(height: topBottomPadding),
          profileImage(imageRadius),
          rectangeContainer(),
          rectangeContainer(),
          rectangeContainer(),
          buttonIsVisible
              ? SizedBox()
              : editButton(() {
                  setState(() {
                    isEditingData = isEditingData ? false : true;
                    buttonIsVisible = false;
                  });
                })
        ],
      ),
    );
  }
}

Widget noneditingTopBar(double topBarHeight) {
  return Container(
    width: double.infinity,
    height: topBarHeight,
    child: Card(
      color: Colors.white,
      elevation: 10,
      child: noneditingProfileData(),
    ),
  );
}

Widget noneditingProfileData() {
  return Center(
    child: Text('Edit Profile',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  );
}

Widget editingTopBar(double topBarHeight) {
  return Container(
    width: double.infinity,
    height: topBarHeight,
    child: Card(
      color: Colors.white,
      elevation: 10,
      child: editingProfileData(),
    ),
  );
}

Widget editingProfileData() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Icon(Icons.close),
      Text('Edit Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      Icon(Icons.check),
    ],
  );
}

Widget profileImage(double imageRadius) {
  return CircleAvatar(
    backgroundImage: NetworkImage(
        "https://avatars0.githubusercontent.com/u/25854605?s=400&u=19fc1a02f0276e3a1d3c0231a7d34af03b9f325a"),
    radius: imageRadius,
  );
}

Container rectangeContainer() {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: textType());
}

Widget textType() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide:
                BorderSide(color: Colors.yellow, style: BorderStyle.solid)),
      )));
}

RaisedButton editButton(Function onClick) {
  return RaisedButton(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
    onPressed: onClick,
    color: Color(0xff71D0D4),
    textColor: Colors.white,
    child: Text("EDIT PROFILE", style: TextStyle(fontSize: 16)),
  );
}
