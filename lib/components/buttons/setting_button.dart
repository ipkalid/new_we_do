import 'package:flutter/material.dart';
import 'package:we_do/style/app_color.dart';

class SettingButton extends StatelessWidget {
  SettingButton({
    @required this.label,
    @required this.onPressed,
    this.height = 54,
    this.hideShadow = false,
    @required this.icon,
  });
  final String label;
  final void Function() onPressed;
  final double height;
  final bool hideShadow;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: height,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: AppColor.kOrange,
          padding: EdgeInsets.symmetric(horizontal: 32),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              size: 36,
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
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
