import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_blog/ui/maps/screen/LoadingMapCircular.dart';
import 'package:travel_blog/ui/post_page/model/PostModel.dart';
import 'package:travel_blog/ui/post_page/service/HttpSharePost.dart';
import 'package:travel_blog/ui/post_page/service/IHttpSharePost.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyUI(),
    );
  }
}

class BodyUI extends StatefulWidget {
  @override
  _BodyUIState createState() => _BodyUIState();
}

class _BodyUIState extends State<BodyUI> {
  Future<String> resmiGonder() async {
    StorageReference resimYeri =
        FirebaseStorage.instance.ref().child(resim.path);

    StorageUploadTask yuklemeGorevi = resimYeri.putFile(resim);
    var indirmeUrl =
        await (await yuklemeGorevi.onComplete).ref.getDownloadURL();
    var url = indirmeUrl.toString();
    return url;
  }

  File resim;

  String metin = "";
  final picker = ImagePicker();

  Future resimAl() async {
    var secilenResim = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      resim = File(secilenResim.path);
    });
  }

  Future<ProfileUserModel> getKullaniciBilgileri() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    IHttpSharePost sharePost = HttpSharePost();
    ProfileUserModel model = await sharePost.getPostUserModel(uid);
    return model;
  }

  Future postuPaylas(
      ProfileUserModel userModel, String resimUrl, LatLng latLng) async {
    String userUid = FirebaseAuth.instance.currentUser.uid;

    String month = DateTime.now().month.toString();
    if (month.length == 1) month = '0$month';
    String day = DateTime.now().day.toString();
    if (day.length == 1) day = '0$day';
    String year = DateTime.now().year.toString();
    String currentDate = year + '-' + month + '-' + day;

    Map<String, String> map = {'url': resimUrl};

    PostModel postModel = PostModel(
        sharedDate: currentDate,
        sharedImg: map,
        sharedLat: latLng.latitude.toString(),
        sharedLong: latLng.longitude.toString(),
        sharedText: metin,
        sharedUserId: userUid.toString(),
        sharedUserName: userModel.userName,
        sharedUserProfileImg: userModel.userProfileImg);
    IHttpSharePost sharePost = HttpSharePost();
    sharePost.postData(postModel, isFoodSelected);
  }

  bool isUploadingData = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: [
      Column(
        children: [b1(), b2(), b3(), b4(), b6(), b7(), b8(context)],
      ),
      isUploadingData ? centerCircular() : SizedBox(),
    ]));
  }

  Widget centerCircular() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 35 / 100, left: width * 10 / 100),
      width: width * 80 / 100,
      height: height * 30 / 100,
      child: Card(
        color: Colors.white70,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(
                strokeWidth: 5, backgroundColor: Colors.white10),
            Text('Loading Location')
          ],
        ),
      ),
    );
  }

  Widget yuklemeAlani() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      height: 200,
      width: 330,
      child: Image.file(resim),
    );
  }

  InkWell b4() {
    return InkWell(
      onTap: resimAl,
      child: Container(
        margin:
            EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
        height: 200.0,
        width: 330.0,
        color: Color(0XFFE3FAFC),
        child: DottedBorder(
            color: Colors.blueAccent,
            strokeWidth: 1,
            child: resim == null ? b41() : yuklemeAlani()),
      ),
    );
  }

  Container b41() {
    return Container(
      padding: EdgeInsets.only(left: 60.0, top: 20.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            child: SvgPicture.asset("assets/images/upload1.svg"),
          ),
          Icon(Icons.cloud_upload, color: Colors.blueAccent, size: 40.0),
          Text(
            "Upload a photo",
            style: GoogleFonts.montserrat(
                color: Colors.blueAccent,
                fontSize: 13.0,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  RaisedButton b8(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: Color(0xff83a4d4),
        ),
      ),
      onPressed: () async {
        setState(() {
          isUploadingData = true;
        });
        String resimUrl = await resmiGonder();
        ProfileUserModel userModel = await getKullaniciBilgileri();
        LatLng latLng = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoadingMapCircular(false)));
        if (latLng != null) {
          //latLng burada geliyor
          print(latLng.latitude.toString());
          print(latLng.longitude.toString());
        }
        await postuPaylas(userModel, resimUrl, latLng);
        Navigator.pop(context);
        setState(() {
          isUploadingData = false;
        });
      },
      color: Color(0xff83a4d4),
      textColor: Colors.white,
      child: Text(
        "Publish Your Post".toUpperCase(),
        style: TextStyle(fontSize: 13),
      ),
      padding:
          EdgeInsets.only(left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
    );
  }

  Column b7() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3)),
            ],
          ),
          margin: EdgeInsets.all(20.0),
          child: new TextField(
            onChanged: (value) {
              setState(() {
                this.metin = value;
              });
            },
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula ligula eu ligula placerat dapibus ut lobortis purus. Aliquam erat volutpat.",
                fillColor: Colors.white70),
          ),
        ),
      ],
    );
  }

  Container b6() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Add a Text",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  bool isFoodSelected = true;
  Color colorIsSelected = Color(0xff83a4d4);
  Color colorIsNotSelected = Color(0xffffffff);

  Container b3() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        children: [
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: colorIsNotSelected)),
            onPressed: () {
              setState(() {
                isFoodSelected = true;
                colorIsSelected = Color(0xff83a4d4);
                colorIsNotSelected = Color(0xffffffff);
              });
            },
            color: colorIsSelected,
            textColor: colorIsNotSelected,
            child: Text(
              "food".toUpperCase(),
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: colorIsSelected)),
            onPressed: () {
              setState(() {
                isFoodSelected = false;
                colorIsSelected = Color(0xffffffff);
                colorIsNotSelected = Color(0xff83a4d4);
              });
            },
            color: colorIsNotSelected,
            textColor: colorIsSelected,
            child: Text("Travel".toUpperCase(), style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Container b2() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            "Select a category",
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  Container b1() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Icon(Icons.arrow_back)),
          Expanded(
            flex: 9,
            child: Center(
              child: Text(
                "Create a Post",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
