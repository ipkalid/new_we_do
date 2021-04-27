import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/model/customer_model.dart';
import 'package:we_do/screens/0_auth_screens/terms_and_conditions.dart';
import 'package:we_do/screens/0_auth_screens/vertification_screen.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';
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

  String error = '';
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
            SizedBox(height: 16),
            Text(error),
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
              label: "Sign Up",
              onPressed: () => postSignUp(),
            )
          ],
        ),
      ),
    );
  }

  postSignUp() async {
    if (nameController.text != '' &&
        phoneNumberController.text != '' &&
        passwordController.text != '' &&
        confirmPasswordController.text != '') {
      setState(() {
        error = '';
      });
      if (passwordController.text != confirmPasswordController.text) {
        print('yes?');
        setState(() {
          error = 'The password and confirmed password did not match';
        });
      } else {
        // the http request
        var response = await Customer.signUp(phoneNumberController.text,
            nameController.text, passwordController.text);

        if (response.customerID == null) {
          setState(() {
            error = 'Please enter a valid information';
          });
        } else {
          Box currentUser = await Hive.openBox<String>("currentUser");
          // Assigning the user info to the hive database (aka offline database)
          currentUser.put("customerID", response.customerID);
          currentUser.put("phoneNumber", response.phoneNumber);
          currentUser.put("walletID", response.walletID);

          goToWeDoCustomerApp();
        }
      }
    } else {
      setState(() {
        error = 'Pleas fill the empty fields';
      });
    }
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

  // ignore: unused_element
  _goToVertificationScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VertificationScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  goToWeDoCustomerApp() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        WeDoCustomerApp.routeName, (Route<dynamic> route) => false);
  }
}
