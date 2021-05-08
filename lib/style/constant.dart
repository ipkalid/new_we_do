import 'package:flutter/material.dart';

//colors constants
const Color mainYellow = Color(0xFFF9ED69);
const Color mainOrange = Color(0xFFF08A5D);
const Color Green = Color(0xFF7DAD40);
const Color Red = Color(0xFFCE2626);

//raised button constants
const Color raisedButtonColor = Color(0xFFFAFAFA);
const double radius = 15.0;
const double shadowElevation = 8;

//text field constants
const Color fieldColor = Color(0xFFF6F6F6);
const Color cursorColor = Color(0xFFF08A5D);
const fieldBorderColor = Color(0xFFE8E8E8);
const Color activeBorderColor = Color(0xFFF08A5D);
const Color hintTextColor = Color(0xFF787878);

//driver offer button constants
const double acceptButtonElevation = 3;

//details constants
const Color detailsBackground = Color(0xFFEFEFEF);

//Calculate the device screen size, used in calculate the size of the scalable size widgets
Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

//Calculate the device screen height, used in calculate the size of the scalable size widgets
double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

//Calculate the device screen width, used in calculate the size of the scalable size widgets
double displayWidth(BuildContext context) {
  return displaySize(context).width;
}