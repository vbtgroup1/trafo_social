import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:travel_blog/ui/maps/key/key.dart';

import '../CircularMapsFinder.dart';
import '../FabButtons.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();

  MapScreen(this.deviceLatLong);

  final LatLng deviceLatLong;
}

class MapScreenState extends State<MapScreen> {
  LatLng currentPosition;
  LatLng deviceCurrentLocation;
  Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;
  Set<Marker> _markers = {};
  GoogleMapsPlaces _places;
  GoogleMapController _mapController;

  bool circularIsVisible = false;

  @override
  Future<void> initState() {
    super.initState();
    currentPosition = widget.deviceLatLong;
    deviceCurrentLocation = widget.deviceLatLong;
    _addMarker(currentPosition);
    _places = GoogleMapsPlaces(apiKey: getApiKey());
  }

  void _addMarker(LatLng latLng) {
    setState(() {
      currentPosition = latLng;
      if (_markers.isNotEmpty) _markers.clear();
      _markers.add(Marker(
          markerId: MarkerId(currentPosition.toString()),
          position: currentPosition,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Selected Location')));
    });
  }

  void currentLocation() {
    _addMarker(deviceCurrentLocation);
    _locationChange();
  }

  void _cameraMoved(CameraPosition position) {
    currentPosition = position.target;
  }

  void _locationChange() {
    _mapController.moveCamera(CameraUpdate.newLatLng(currentPosition));
  }

  void _mapCreated(GoogleMapController controller) {
    _mapController = controller;
    _controller.complete(_mapController);
  }

  void _mapTypeSelector() {
    setState(() {
      _mapType =
          _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void saveLatLng() {
    Navigator.pop(context, currentPosition);
  }

  Future<LatLng> displayPrediction(Prediction p) async {
    LatLng willReturnLatLng;
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;
      willReturnLatLng = LatLng(lat, lng);
    } else {
      willReturnLatLng =
          LatLng(currentPosition.latitude, currentPosition.longitude);
    }
    return willReturnLatLng;
  }

  void showProgress() {
    setState(() {
      circularIsVisible = true;
    });
  }

  void hideProgress() {
    setState(() {
      circularIsVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                mapType: _mapType,
                initialCameraPosition:
                    CameraPosition(target: currentPosition, zoom: 18),
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                markers: _markers,
                onCameraMove: _cameraMoved,
                onMapCreated: _mapCreated,
                onTap: (value) => _addMarker(value),
              ),
              GestureDetector(
                onTap: () async {
                  Prediction p = await PlacesAutocomplete.show(
                      context: context, apiKey: getApiKey());
                  showProgress();
                  LatLng latLng = await displayPrediction(p);
                  _addMarker(latLng);
                  _locationChange();
                  hideProgress();
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.08,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((10))),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: Text('Enter adress...'),
                          ),
                          Icon(Icons.search)
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FabButton(
                          screenWidth, saveLatLng, Colors.purple, Icons.send),
                      SizedBox(height: screenWidth * 0.02),
                      FabButton(screenWidth, _mapTypeSelector, Colors.green,
                          Icons.map),
                      SizedBox(height: screenWidth * 0.02),
                      FabButton(screenWidth, currentLocation, Colors.blue,
                          Icons.my_location),
                      SizedBox(height: screenWidth * 0.05)
                    ],
                  ),
                ),
              ),
              CustomCircularBar(
                  screenWidth, circularIsVisible, 'Searching Location'),
            ],
          ),
        ),
      ),
    );
  }
}
