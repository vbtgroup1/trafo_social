import 'package:flutter/material.dart';

class CustomCircularBar extends StatelessWidget {
  CustomCircularBar(this.size, this.isVisible, this.message);

  double size;
  bool isVisible;
  String message;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            width: size * 0.5,
            height: size * 0.3,
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
                  Text(message)
                ],
              ),
            ),
          )),
    );
  }
}
