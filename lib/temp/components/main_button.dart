import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class MainButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;

  MainButton(
      {@required this.onPressed,
      @required this.text,
      this.buttonColor: mainOrange,
      this.textColor: Colors.white});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      elevation: shadowElevation,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: mainButtonTextStyle(context, textColor),
            ),
          ],
        ),
      ),
    );
  }
}
