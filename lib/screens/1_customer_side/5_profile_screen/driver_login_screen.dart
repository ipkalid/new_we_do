import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/helper/hive_preferences.dart';

class DriverLoginScreen extends StatefulWidget {
  DriverLoginScreen({Key key, @required this.loginAsDriverPressed})
      : super(key: key);
  final void Function() loginAsDriverPressed;

  @override
  _DriverLoginScreenState createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
  TextEditingController mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff7AA4E3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RegularTextField(
              withLabel: true,
              label: "KFUPM Mail",
              controller: mailController,
            ),
            SizedBox(height: 64),
            ActionButton(
              label: "Log in",
              onPressed: () {
                globalKfupmMail = mailController.text;
                widget.loginAsDriverPressed();
              },
            )
          ],
        ),
      ),
    );
  }
}
