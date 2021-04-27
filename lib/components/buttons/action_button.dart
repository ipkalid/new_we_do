import 'package:flutter/material.dart';
import 'package:we_do/style/app_color.dart';
import 'package:we_do/style/app_theme.dart';

class ActionButton extends StatelessWidget {
  ActionButton(
      {@required this.label,
      this.active = true,
      @required this.onPressed,
      this.height = 48,
      this.hideShadow = false,
      this.color = AppColor.kOrange});
  final bool active;
  final Color color;
  final String label;
  final void Function() onPressed;
  final double height;
  final bool hideShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: active ? color : Colors.grey,
        boxShadow: hideShadow ? [] : [kBoxShadow],
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: TextButton(
        onPressed: active ? onPressed : null,
        child: Text(
          label,
          maxLines: 1,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
