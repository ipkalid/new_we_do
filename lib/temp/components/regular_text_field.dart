import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class RegularTextField extends StatelessWidget {

  final bool visibility;
  final Color borderColor;
  final String hintText;
  final Object suffix;
  final TextInputType inputType;
  final Function onChanged;
  final bool enabled;
  // ignore: missing_required_param
  static const MaterialButton defaultSuffix = MaterialButton(height: 0, minWidth: 0, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,);
  //TODO: add on pressed;


  RegularTextField({this.borderColor: fieldBorderColor, this.enabled: true, this.inputType: TextInputType.text, this.suffix: defaultSuffix, this.hintText: " ", this.visibility: true, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      keyboardType: inputType,
      onChanged: onChanged,
      cursorColor: cursorColor,
      obscureText: !visibility,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: activeBorderColor),
        ),
        hintText: hintText,
        hintStyle: hintTextStyle(context),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        filled: true, fillColor: fieldColor,
        suffix: suffix,
      ),
    );
  }
}
