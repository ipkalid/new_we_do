import 'package:flutter/material.dart';
import 'package:we_do/style/color_theme.dart';

class TextStyleTheme {
  static const introPressedText = TextStyle(
    color: ColorTheme.kPurple,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const introOrangeText = TextStyle(
    color: ColorTheme.kOrange,
    fontSize: 17,
  );

  static const kActionButtonTextStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);

  static const kButtonTextStyle =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static const selectedNavBarTextSyile = TextStyle(
    fontWeight: FontWeight.w700,
  );
  static const unSelectedNavBarTextSyile = TextStyle(
    fontWeight: FontWeight.w400,
  );
}
