import 'package:flutter/material.dart';
import '../../style/constant.dart';
import '../../style/style.dart';

class HistoryButton extends StatelessWidget {
  final String orderName;
  final String orderTime;
  final Function onPressed;

  HistoryButton(
      {@required this.onPressed,
      @required this.orderName,
      @required this.orderTime});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: raisedButtonColor,
        elevation: shadowElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: mainYellow,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 0.11 * displayWidth(context),
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      orderName,
                      style: orderNameRequestButtonStyle(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      orderTime,
                      style: orderTimeRequestButtonStyle(context),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 0.14 * displayWidth(context),
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
