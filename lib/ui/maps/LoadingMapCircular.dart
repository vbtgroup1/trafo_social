import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_blog/ui/maps/MapScreen.dart';

import 'locationServices.dart';

class LoadingMapCircular extends StatefulWidget {
  @override
  _LoadingMapCircularState createState() => _LoadingMapCircularState();

  LoadingMapCircular(this.haveLocation, {this.latLng});

  final bool haveLocation;
  final LatLng latLng;
}

class _LoadingMapCircularState extends State<LoadingMapCircular> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.haveLocation) {
        await getLocation().then((value) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MapScreen(widget.latLng))));
      } else {
        await getLocation().then((value) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MapScreen(value))));
      }
    });
  }

  Future<LatLng> getLocation() async {
    LocationServices locationServices = LocationServices();
    LatLng latLng = await locationServices.getLocation();
    return latLng;
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;

    return Visibility(
      child: Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            width: widthSize * 80 / 100,
            height: heightSize * 25 / 100,
            child: Card(
              color: Colors.white70,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(
                      strokeWidth: 5, backgroundColor: Colors.white10),
                  Text('Loading Location')
                ],
              ),
            ),
          )),
    );
  }
}
