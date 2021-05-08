import 'package:flutter/material.dart';
import 'package:we_do/style/constant.dart';
import 'package:we_do/style/style.dart';


class PaymentMethodButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String text;

  PaymentMethodButton(
      {@required this.onPressed, this.icon: Icons.payment, this.text: "Card"});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: raisedButtonColor,
          elevation: shadowElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 0.11 * displayWidth(context),
                color: Colors.black,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: paymentButtonTextStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
