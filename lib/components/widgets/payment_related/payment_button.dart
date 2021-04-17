import 'package:flutter/material.dart';
import 'package:we_do/style/color_theme.dart';
import 'package:we_do/style/theme.dart';

class PaymentButton extends StatelessWidget {
  PaymentButton(
      {@required this.label,
      this.active = true,
      @required this.onPressed,
      this.height = 60,
      this.hideShadow = false,
      this.icon});
  final bool active;
  final String label;
  final void Function() onPressed;
  final double height;
  final bool hideShadow;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        //color: active ? ColorTheme.kGrey : Colors.grey,
        boxShadow: hideShadow ? [] : [kBoxShadow],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorTheme.kGrey,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
        onPressed: active ? onPressed : null,
        child: Row(
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.black,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
