import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:we_do/components/buttons/action_button.dart';

class VertificationScreen extends StatefulWidget {
  static const routeName = '/signup-screen';

  const VertificationScreen({Key key}) : super(key: key);

  @override
  _VertificationScreenState createState() => _VertificationScreenState();
}

class _VertificationScreenState extends State<VertificationScreen> {
  String otbToken;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Vertification Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PinCodeTextField(
                enableActiveFill: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 62,
                  borderWidth: 1,
                  selectedColor: Color(0xffE8E8E8),
                  selectedFillColor: Color(0xffF6F6F6),
                  inactiveFillColor: Color(0xffF6F6F6),
                  inactiveColor: Color(0xffE8E8E8),
                  activeColor: Color(0xffE8E8E8),
                  activeFillColor: Color(0xffF6F6F6),
                ),
                length: 4,
                appContext: context,
                onChanged: (String value) {
                  otbToken = value;
                },
              ),
            ),
            SizedBox(height: 64),
            ActionButton(label: "Sign Up", onPressed: () => print(otbToken))
          ],
        ),
      ),
    );
  }
}
