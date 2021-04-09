import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  RegularTextField({
    @required this.controller,
    this.label,
    this.isPasswaord = false,
  });
  final TextEditingController controller;
  final String label;
  final bool isPasswaord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        obscureText: isPasswaord,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: (label == null) ? "" : label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
