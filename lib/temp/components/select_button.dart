import 'package:flutter/material.dart';
import '../../style/style.dart';

class SelectButton extends StatelessWidget {
  SelectButton(
      {@required this.onPressed, @required this.buttonLabel, this.label});

  final void Function() onPressed;
  final String label;
  final String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label == null)
            ? Container()
            : Text(
                label,
                style: labelStyle(context),
              ),
        SizedBox(height: 4),
        Container(
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
                buttonLabel,
                style: TextStyle(color: Color(0xff787878), fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
