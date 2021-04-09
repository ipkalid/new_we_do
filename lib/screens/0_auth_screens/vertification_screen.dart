import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/screens/0_auth_screens/terms_and_conditions.dart';
import 'package:we_do/style/text_style_theme.dart';

class VertificationScreen extends StatefulWidget {
  static const routeName = '/signup-screen';

  const VertificationScreen({Key key}) : super(key: key);

  @override
  _VertificationScreenState createState() => _VertificationScreenState();
}

class _VertificationScreenState extends State<VertificationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
          children: [
            // PinCodeTextField(
            //   enableActiveFill: true,
            //   animationType: AnimationType.fade,
            //   pinTheme: PinTheme(
            //     shape: PinCodeFieldShape.box,
            //     borderRadius: BorderRadius.circular(6),
            //     fieldHeight: 58,
            //     fieldWidth: 64,
            //     selectedColor: Colors.transparent,
            //     //selectedFillColor: kTextFiieldBackgroundColor,
            //     inactiveFillColor: Colors.transparent,
            //     inactiveColor: Colors.grey,
            //     activeColor: Colors.transparent,
            //     //activeFillColor: kTextFiieldBackgroundColor,
            //   ),
            //   length: 4,
            //   appContext: context,
            //   onChanged: (String value) {
            //     code = value;
            //   },
            // ),

            SizedBox(height: 32),
            ActionButton(
                label: "Sign Up", onPressed: () => print(nameController.text))
          ],
        ),
      ),
    );
  }
}
