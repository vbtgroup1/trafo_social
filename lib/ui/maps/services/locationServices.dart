import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationServices {
  LocationServices() {
    _location = Location();
  }

  Location _location;
  double _latitude;
  double _longitude;
  LatLng latLng;

  double get latitude => _latitude;

  double get longitude => _longitude;

  Future<bool> isServiceEnabled() async {
    try {
      bool requestService = await _location.serviceEnabled();

      return requestService;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _requestService() async {
    try {
      bool request = await _location.requestService();
      return request;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _isPermissionGranted() async {
    try {
      PermissionStatus permission = await _location.hasPermission();

      if (permission == PermissionStatus.granted)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _requestPermission() async {
    try {
      PermissionStatus permissionResult = await _location.requestPermission();
      if (permissionResult == PermissionStatus.granted)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<LatLng> _getLocationData() async {
    try {
      LocationData locationData = await _location.getLocation();
      this._latitude = locationData.latitude;
      this._longitude = locationData.longitude;
      LatLng latLng = LatLng(locationData.latitude, locationData.longitude);
      return latLng;
    } catch (e) {
      return LatLng(1, 1);
    }
  }

  Future<LatLng> getLocation() async {
    LocationServices locationServices = LocationServices();

    bool serviceEnabled = await locationServices.isServiceEnabled();
    while (!serviceEnabled) {
      serviceEnabled = await locationServices._requestService();
      showToast('Please open your location services',
          bdColor: Colors.black54, txtColor: Colors.white);
    }

    bool hasPermission = await locationServices._isPermissionGranted();
    while (!hasPermission) {
      showToast('Please allow your location services',
          bdColor: Colors.black54, txtColor: Colors.white);
      hasPermission = await locationServices._requestPermission();
    }

    LatLng isFetchedLocation = await locationServices._getLocationData();

    return isFetchedLocation;
  }
}

void showToast(String msg,
    {Color bdColor = Colors.blue, Color txtColor = Colors.white}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bdColor,
      textColor: txtColor,
      fontSize: 16.0);
  sleep(Duration(seconds: 1));
  Fluttertoast.cancel();
}
