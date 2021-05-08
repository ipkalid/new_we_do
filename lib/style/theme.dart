import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

//Collors
const kLightBlue = Color(0xff58C5C7);
const kLightGreen = Color(0xffCAE3B3);
const kMainLightBackgroundColor = Color(0xffEDEDED);
const kMainDarkBackgroundColor = Color(0xff1C2C35);
const kNavBarLightColor = Colors.white;
const kNavBarDarkColor = Color(0xff0D1519);

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

//Shadow
const kBoxShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, .12),
  blurRadius: 6,
  offset: Offset(2, 2),
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

//Ntifications Card Style
const kButtonTextStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
const kNotifTitleStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
const kNotifdateStile =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600);
const kNotifTypeStyle =
    TextStyle(fontSize: 12, color: kLightBlue, fontWeight: FontWeight.w700);
const kNotifSubTitleStyle = TextStyle(fontSize: 12);
const kAppBarTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

//Themes
ThemeData kCustomerTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    color: mainYellow,
    textTheme: TextTheme(
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //elevation: 10,
    backgroundColor: Colors.white,
    selectedItemColor: mainOrange,
    unselectedItemColor: mainOrange.withOpacity(.50),
  ),
  dividerColor: Colors.black.withOpacity(.3),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.black),
  ),
);

ThemeData kDriverTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    color: Color(0xff7AA4E3),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //elevation: 10,
    backgroundColor: Colors.white,
    selectedItemColor: mainOrange,
    unselectedItemColor: mainOrange.withOpacity(.50),
  ),
  dividerColor: Colors.black.withOpacity(.3),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.black),
  ),
);
