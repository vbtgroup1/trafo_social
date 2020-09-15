import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_blog/ui/profile_edit_page/viewModel/editProfileViewModel.dart';

double deviceWidth;
double deviceHeight;
double circleProfileImageRadius;
double topBarHeight;
double topBottomPadding;
double circularRadius;

class EditProfileView extends EditProfileViewModel {
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    circleProfileImageRadius = deviceWidth * 20 / 100;
    topBarHeight = deviceHeight * 10 / 100;
    topBottomPadding = deviceHeight * 4 / 100;
    circularRadius = deviceWidth * 20 / 100;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isEditingData
              ? editingTopBar(topBarHeight, savedProfileState)
              : noneditingTopBar(topBarHeight, context),
          SizedBox(height: topBottomPadding),
          profileImage(getImage, pickedImage, circleProfileImageRadius,
              isImagePicking, isEditingData),
          profileInfoList(
              textEditingController, textFieldsDefaultValues, isEditingData),
          dateTimePicker(
              textFieldsDefaultValues[3], isEditingData, context, getDateTime),
          genderPicker(saveGender),
          buttonIsVisible ? editButton(editProfileState) : SizedBox(),
        ],
      ),
    );
  }
}

Widget noneditingTopBar(double topBarHeight, BuildContext context) {
  return Container(
    width: double.infinity,
    height: topBarHeight,
    child: Card(
      color: Colors.white,
      elevation: 10,
      child: noneditingProfileData(context),
    ),
  );
}

Widget noneditingProfileData(BuildContext context) {
  return Center(
      child: ListTile(
    leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios),
        onTap: () {
          Navigator.of(context).pop();
        }),
    title: Text('Profile',
        style:
            GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold)),
  ));
}

Widget editingTopBar(double topBarHeight, Function savedProfileState) {
  return Container(
    width: double.infinity,
    height: topBarHeight,
    child: Card(
      color: Colors.white,
      elevation: 10,
      child: editingProfileData(savedProfileState),
    ),
  );
}

Widget editingProfileData(Function savedProfileState) {
  return Center(
      child: ListTile(
    leading:
        GestureDetector(child: Icon(Icons.close), onTap: savedProfileState),
    trailing:
        GestureDetector(child: Icon(Icons.check), onTap: savedProfileState),
    title: Text(
      "Edit Profile",
      style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  ));
}

Widget profileImage(Function pickImageFromGallery, File profileImage,
    double imageRadius, bool isImagePicking, bool isEditingData) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      CircleAvatar(
        backgroundImage: isImagePicking
            ? FileImage(profileImage)
            : AssetImage('assets/images/profileUser.png'),
        radius: imageRadius,
      ),
      FloatingActionButton(
        onPressed: isEditingData ? pickImageFromGallery : () {},
        mini: true,
        backgroundColor: Colors.white,
        child: Icon(Icons.camera_enhance, color: Colors.black),
      )
    ],
  );
}

ListView profileInfoList(List textEditingController,
    List textFieldsDefaultValues, bool isEditingData) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) {
      textEditingController.add(new TextEditingController());
      return textFields(textEditingController[index],
          textFieldsDefaultValues[index], isEditingData);
    },
  );
}

Widget textFields(
    TextEditingController controller, String defaultValue, bool isEditingData) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(circularRadius),
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: defaultValue,
            enabled: isEditingData,
          )),
    ),
  );
}

Widget genderPicker(Function save) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GenderPickerWithImage(
      showOtherGender: false,
      verticalAlignedText: false,
      femaleImage: AssetImage('assets/images/female.png'),
      maleImage: AssetImage('assets/images/male.png'),
      selectedGenderTextStyle:
          TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
      unSelectedGenderTextStyle:
          TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      onChanged: (Gender gender) {
        save(gender);
      },
      equallyAligned: true,
      animationDuration: Duration(milliseconds: 300),
      isCircular: true,
      opacityOfGradient: 0.4,
      size: 50,
    ),
  );
}

Widget dateTimePicker(String defaultValue, bool isEditingData,
    BuildContext context, Function getDateTime) {
  return GestureDetector(
    child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
              decoration:
                  InputDecoration(labelText: defaultValue, enabled: false)),
        )),
    onTap: isEditingData ? getDateTime : null,
  );
}

Widget editButton(Function onClick) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16),
    child: RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
      onPressed: onClick,
      color: Color(0xff71D0D4),
      textColor: Colors.white,
      child: Text("EDIT PROFILE",
          style: GoogleFonts.montserrat(
              fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}
