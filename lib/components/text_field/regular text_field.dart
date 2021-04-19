import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  RegularTextField({
    @required this.controller,
    this.label,
    this.isPasswaord = false,
    this.withLabel = false,
    this.keyboardType = TextInputType.text
  });
  final TextEditingController controller;
  final String label;
  final bool isPasswaord;
  final bool withLabel;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (withLabel)
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        SizedBox(
          height: 48,
          child: TextField(
            keyboardType: keyboardType,
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
        ),
      ],
    );
  }
}
