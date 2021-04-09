import 'package:flutter/material.dart';
import 'package:we_do/style/color_theme.dart';
import 'package:we_do/style/theme.dart';

class ActionButton extends StatelessWidget {
  ActionButton(
      {@required this.label,
      this.active = true,
      @required this.onPressed,
      this.height = 48,
      this.hideShadow = false,
      this.color = ColorTheme.kOrange});
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
        borderRadius: BorderRadius.all(Radius.circular(6)),
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
