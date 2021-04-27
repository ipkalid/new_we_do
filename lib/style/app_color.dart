import 'package:flutter/material.dart';

class AppColor {
  static const kYello = Color(0xffF9ED69);
  static const kOrange = Color(0xffF08A5D);
  static const kPurple = Color(0xff62479A);
  static const kGrey = Color(0xffFAFAFA);
  static const kBlue = Color(0xff7AA4E3);

  static const cursorColor = Color(0xFFF08A5D);

  static const kMainLightBackgroundColor = Color(0xffEDEDED);
  static const kMainDarkBackgroundColor = Color(0xff1C2C35);
  static const kNavBarLightColor = Colors.white;
  static const kNavBarDarkColor = Color(0xff0D1519);

  static const shadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .2),
    blurRadius: 8,
    offset: Offset(3, 3),
  );
}
