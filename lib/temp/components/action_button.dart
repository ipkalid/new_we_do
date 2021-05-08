import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';
import 'main_button.dart';

class ActionButton extends StatelessWidget {

  final Function onPressed;
  final String orderName;
  final String date;
  final String orderTime;
  final Color buttonColor;
  final String buttonText;

  ActionButton({@required this.onPressed, @required this.orderName, @required this.date, @required this.orderTime, @required this.buttonText, this.buttonColor: mainOrange});

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(orderName,
                style: orderNameStyle(context),
              ),
              Text(date + " " + orderTime,
                style:orderTimeStyle(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: MainButton(onPressed: onPressed, text: buttonText, buttonColor: buttonColor,),
        ),
      ],
    );
  }
}
