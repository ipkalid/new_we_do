import 'package:flutter/material.dart';
import 'constant.dart';

TextStyle buttonTextStyle(var context) {
  return TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}

TextStyle appBarTextStyle(var context) {
  return TextStyle(
    color: Colors.black,
    fontSize: 22,
  );
}

TextStyle clickableTextStyle(var context) {
  return TextStyle(
      color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.w900);
}

TextStyle messagesStyle(var context) {
  return TextStyle(
      color: Color(0xFFF08A5D), fontSize: 16, fontWeight: FontWeight.w700);
}

TextStyle warningTextStyle(var context) {
  return TextStyle(
      color: Colors.red,
      fontSize: 0.038 * displayWidth(context),
      fontWeight: FontWeight.w700);
}

TextStyle successfulTextStyle(var context) {
  return TextStyle(
      color: Colors.green,
      fontSize: 0.038 * displayWidth(context),
      fontWeight: FontWeight.w700);
}

const textFiledFillColor = Color(0xFFF6F6F6);

ThemeData mainTheme = ThemeData(
  primaryColor: Color(0xFFF9ED69),
  scaffoldBackgroundColor: Colors.white,
  buttonColor: Color(0xFFF08A5D),
);

//action_button styles
TextStyle orderNameStyle(var context) {
  return TextStyle(
    fontSize: 0.063 * displayWidth(context),
    fontWeight: FontWeight.w700,
  );
}

TextStyle orderTimeStyle(var context) {
  return TextStyle(
      fontSize: 0.04 * displayWidth(context), fontWeight: FontWeight.w300);
}

//address_button styles
TextStyle addressNameStyle(var context) {
  return TextStyle(
      fontSize: 0.045 * displayWidth(context), fontWeight: FontWeight.w500);
}

TextStyle buildingNumberStyle(var context) {
  return TextStyle(
    fontSize: 0.045 * displayWidth(context),
    fontWeight: FontWeight.w300,
  );
}

TextStyle roomStyle(var context) {
  return TextStyle(
    fontSize: 0.045 * displayWidth(context),
    fontWeight: FontWeight.w300,
  );
}

//button_with_icon style
TextStyle textStyle(var context) {
  return TextStyle(
      fontSize: 0.05 * displayWidth(context), fontWeight: FontWeight.w500);
}

//details styles
TextStyle headerStyle(var context) {
  return TextStyle(
      fontSize: 0.045 * displayWidth(context), fontWeight: FontWeight.w700);
}

TextStyle detailsStyle(var context) {
  return TextStyle(
      fontSize: 0.045 * displayWidth(context), fontWeight: FontWeight.w400);
}

//driver_button style
TextStyle driverNameStyle(var context) {
  return TextStyle(
      fontSize: 0.045 * displayWidth(context), fontWeight: FontWeight.w300);
}

//driver_offer_button style
TextStyle priceButton(var context) {
  return TextStyle(
    fontSize: 0.045 * displayWidth(context),
    fontWeight: FontWeight.w700,
  );
}

TextStyle acceptButtonStyle(var context) {
  return TextStyle(
      fontSize: 0.043 * displayWidth(context),
      fontWeight: FontWeight.w700,
      color: Colors.white);
}

//general_offer styles
TextStyle driverNameOfferStyle(var context) {
  return TextStyle(
      fontSize: 0.037 * displayWidth(context),
      fontWeight: FontWeight.w500,
      color: Colors.black);
}

TextStyle orderNameOfferStyle(var context) {
  return TextStyle(
      fontSize: 0.045 * displayWidth(context),
      fontWeight: FontWeight.w500,
      color: Colors.black);
}

TextStyle headersStyle(var context) {
  return TextStyle(
      fontSize: 0.039 * displayWidth(context),
      fontWeight: FontWeight.w200,
      color: Colors.black);
}

TextStyle dataStyle(var context) {
  return TextStyle(
      fontSize: 0.039 * displayWidth(context),
      fontWeight: FontWeight.w400,
      color: Colors.black);
}

TextStyle availableTimeStyle(var context) {
  return TextStyle(
      fontSize: 0.039 * displayWidth(context),
      fontWeight: FontWeight.w500,
      color: Color(0xFF5BA744));
}

//main_button styles
TextStyle mainButtonTextStyle(var context, Color textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 0.05 * displayWidth(context),
      fontWeight: FontWeight.w700);
}

//main_button styles
TextStyle paymentButtonTextStyle(var context) {
  return TextStyle(
      fontSize: 0.055 * displayWidth(context),
      fontWeight: FontWeight.w300,
      color: Colors.black);
}

//price styles
TextStyle totalPriceHeaderStyle(var context) {
  return TextStyle(
      fontSize: 0.042 * displayWidth(context), fontWeight: FontWeight.w300);
}

TextStyle priceStyle(var context) {
  return TextStyle(
    fontSize: 0.063 * displayWidth(context),
    fontWeight: FontWeight.w400,
  );
}

TextStyle SARStyle(var context) {
  return TextStyle(
      fontSize: 0.042 * displayWidth(context), fontWeight: FontWeight.w300);
}

//text_field styles
TextStyle hintTextStyle(var context) {
  return TextStyle(
    fontSize: 0.045 * displayWidth(context),
    fontWeight: FontWeight.w500,
    color: hintTextColor,
  );
}

TextStyle labelStyle(var context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 0.045 * displayWidth(context),
  );
}

//request_button styles
TextStyle orderNameRequestButtonStyle(var context) {
  return TextStyle(
    color: Colors.black,
      fontSize: 0.062 * displayWidth(context), fontWeight: FontWeight.w500);
}

TextStyle orderTimeRequestButtonStyle(var context) {
  return TextStyle(
    color: Colors.black,
    fontSize: 0.04 * displayWidth(context),
    fontWeight: FontWeight.w300,
  );
}
