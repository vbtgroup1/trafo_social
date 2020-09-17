import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_blog/ui/profile_edit_page/service/HttpProfileService.dart';
import 'package:travel_blog/ui/profile_edit_page/service/IHttpProfileService.dart';
import 'package:travel_blog/ui/profile_edit_page/view/editProfile.dart';
import 'package:travel_blog/ui/profile_edit_page/view/editProfileView.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

abstract class EditProfileViewModel extends State<EditProfile> {
  bool isEditingData = false;
  bool buttonIsVisible = true;
  bool isImagePicking = false;
  List<TextEditingController> textEditingController;
  List<String> textFieldsDefaultValues;
  String dateTime;
  Gender selectedGender = Gender.Male;
  UserModel userModel;

  File pickedImage;
  final picker = ImagePicker();
  String imageUrl;

  @override
  void initState() {
    super.initState();
    textEditingController = List();
    for (int i = 0; i < 5; i++) {
      textEditingController.add(new TextEditingController());
    }
    textFieldsDefaultValues = ['Name', 'Email', 'Jobs', 'Date of Birth'];
    userModel = widget.userModel;
    initGender();
    initDateTime();
  }

  void initGender() {
    setState(() {
      if (userModel.userGender.toLowerCase() == 'female' ||
          userModel.userGender.toLowerCase() == 'women') {
        selectedGender = Gender.Female;
      } else
        selectedGender = Gender.Male;
    });
  }

  void initDateTime() {
    setState(() {
      dateTime = userModel.userBirth;
    });
  }

  void saveGender(Gender gender) {
    this.selectedGender = gender;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        isImagePicking = true;
        pickedImage = File(pickedFile.path);
      });
      await uploadFile();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.forEach((element) {
      element.dispose();
    });
    isDefault = true;
    isDateFirstPicker = true;
  }

  void editProfileState() {
    setState(() {
      isEditingData = true;
      buttonIsVisible = false;
    });
  }

  Future savedProfileState() async {
    setState(() {
      isEditingData = false;
      buttonIsVisible = true;
    });
    await uploadFile();
    await uploadModel();
  }

  Future uploadFile() async {
    if (pickedImage != null) {
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child('users/}');
      StorageUploadTask uploadTask = storageReference.putFile(pickedImage);
      await uploadTask.onComplete;
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          imageUrl = fileURL;
        });
      });
    }
  }

  Future uploadModel() async {
    String userName = this.textEditingController[0].text ?? userModel.userName;
    String userEmail =
        this.textEditingController[1].text ?? userModel.userEmail;
    String userJob = this.textEditingController[2].text ?? userModel.userJob;
    String userDate = this.textEditingController[3].text ?? userModel.userBirth;
    String userGender =
        this.textEditingController[4].text ?? userModel.userGender;
    UserModel tempModel = UserModel(
        userBirth: userDate.toString(),
        userEmail: userEmail.toString(),
        userGender: userGender.toString(),
        userJob: userJob.toString(),
        userName: userName.toString(),
        userProfileImg: imageUrl);
    IHttpProfileService httpProfileService = HttpProfileService();
    await httpProfileService.postUserInfo(tempModel, "2");
  }

  void nonSavedProfileState() {
    setState(() {
      isEditingData = false;
      buttonIsVisible = true;
      textEditingController[0].text = userModel.userName;
      textEditingController[1].text = userModel.userEmail;
      textEditingController[2].text = userModel.userJob;
      textEditingController[3].text = userModel.userBirth;
      textEditingController[4].text = userModel.userGender;
    });
  }

  void getDateTime() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2019, 9, 15), onConfirm: (date) {
      setState(() {
        dateTime = '${date.year}/${date.month}/${date.day}';
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
