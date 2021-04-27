import 'package:flutter/material.dart';
import 'package:we_do/style/app_color.dart';

const kYello = Color(0xffF9ED69);
const kOrange = Color(0xffF08A5D);
const kLightBlue = Color(0xff58C5C7);

const kLightGreen = Color(0xffCAE3B3);
const kMainLightBackgroundColor = Color(0xffEDEDED);
const kMainDarkBackgroundColor = Color(0xff1C2C35);
const kNavBarLightColor = Colors.white;
const kNavBarDarkColor = Color(0xff0D1519);

const kBoxShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, .2),
  blurRadius: 8,
  offset: Offset(3, 3),
);

var shortShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  blurRadius: 1,
  offset: Offset(0, 2),
);

//Text Styles
const textStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const selectedNavBarTextSyile = TextStyle(
  fontWeight: FontWeight.w700,
);
const unSelectedNavBarTextSyile = TextStyle(
  fontWeight: FontWeight.w400,
);

const kButtonTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);

class AppTheme {
  static ThemeData customerTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      color: AppColor.kYello,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    ),
  );
  static ThemeData driverTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      color: AppColor.kBlue,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    ),
  );
}
