import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  SelectButton({
    this.label,
    this.onPressed,
    this.isSelected = false,
  });
  final String label;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          enableFeedback: false,
          shadowColor: Colors.black.withOpacity(.4),
          elevation: 8,
          primary: Color(0xffF6F6F6),
        ),
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.black : Color(0xff787878),
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
