import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  FabButton(this.screenWidth, this.onPressed, this.bdColor, this.iconData);

  final double screenWidth;
  final Function onPressed;
  final Color bdColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        onPressed: onPressed,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        fillColor: bdColor,
        shape: CircleBorder(),
        splashColor: Colors.white54,
        elevation: 4,
        child: Icon(iconData, size: screenWidth * 0.09, color: Colors.white),
      ),
      width: screenWidth * 0.14,
      height: screenWidth * 0.14,
    );
  }
}
