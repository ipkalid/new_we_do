import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/screens/0_auth_screens/terms_and_conditions.dart';
import 'package:we_do/screens/0_auth_screens/vertification_screen.dart';
import 'package:we_do/style/app_text_style.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';

  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            RegularTextField(
              controller: nameController,
              label: "Name",
            ),
            SizedBox(height: 16),
            RegularTextField(
              controller: phoneNumberController,
              label: "Phone Number",
            ),
            SizedBox(height: 16),
            RegularTextField(
              controller: passwordController,
              label: "Password",
              isPasswaord: true,
            ),
            SizedBox(height: 16),
            RegularTextField(
              controller: confirmPasswordController,
              label: "Confirm Password",
              isPasswaord: true,
            ),
            SizedBox(height: 32),
            Text(
              "By Sign Up You Agree to",
              textAlign: TextAlign.center,
              style: AppTextStyle.introOrangeText,
            ),
            TextButton(
              onPressed: () => _goToTermsAndConditionsScreen(),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Terms And Conditions",
                style: AppTextStyle.introPressedText,
              ),
            ),
            SizedBox(height: 32),
            ActionButton(
                label: "Sign Up", onPressed: () => _goToVertificationScreen())
          ],
        ),
      ),
    );
  }

  _goToTermsAndConditionsScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TermsAndConditionsScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  _goToVertificationScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VertificationScreen(),
        fullscreenDialog: true,
      ),
    );
  }
}
