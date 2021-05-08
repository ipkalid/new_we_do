import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final bool visibility;
  final Color borderColor;
  final String hintText;
  final Object suffix;
  final TextInputType inputType;
  final Function onChanged;
  final bool enabled;
  final bool isCentered;
  final int maxLength;
  static const FlatButton defaultSuffix = FlatButton(
    height: 0,
    minWidth: 0,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    onPressed: null,
    child: null,
  );

  TextFieldWithLabel(
      {this.label: "",
      this.borderColor: fieldBorderColor,
      this.enabled: true,
      this.inputType: TextInputType.text,
      this.suffix: defaultSuffix, //WHY THIS HERE
      this.hintText: " ",
      this.visibility: true,
      @required this.onChanged,
      this.isCentered = false,
      this.maxLength = 99});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != "")
          Text(
            label,
            style: labelStyle(context),
          ),
        SizedBox(height: 2),
        Container(
          height: (inputType == TextInputType.multiline) ? 135 : 50,
          child: TextField(
            maxLength: maxLength,
            buildCounter: (BuildContext context,
                    {int currentLength, int maxLength, bool isFocused}) =>
                null,
            maxLines: (inputType == TextInputType.multiline) ? 5 : 1,
            enabled: enabled,
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
            keyboardType: inputType,
            onChanged: onChanged,
            cursorColor: cursorColor,
            obscureText: !visibility,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: fieldBorderColor),
              ),
              hintText: hintText,
              //hintStyle: hintTextStyle(context),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              filled: true,
              fillColor: fieldColor,
              suffix: suffix,
            ),
          ),
        ),
      ],
    );
  }
}
