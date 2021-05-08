import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class ButtonWithIcon extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function onPressed;

  ButtonWithIcon ({@required this.icon, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: raisedButtonColor,
      elevation: shadowElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Icon(icon, size: 0.095*displayWidth(context),)
            ),
            SizedBox(width: 20,),
            Expanded(
              flex: 4,
              child: Text(text,
                style: textStyle(context),
              ),
            ),
            Expanded(
                flex: 1,
                child: Icon(Icons.arrow_forward_ios, size: 0.065*displayWidth(context),)
            )
          ],
        ),
      ),
    );
  }
}
