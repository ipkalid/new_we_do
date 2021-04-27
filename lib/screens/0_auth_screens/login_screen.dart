import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    border: Border.all(
                      color: Color(0xffE8E8E8),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text("+966"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: RegularTextField(
                    controller: phoneNumberController,
                    label: "Phone Number",
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            RegularTextField(
              controller: passwordController,
              label: "Password",
              isPasswaord: true,
            ),
            SizedBox(height: 64),
            ActionButton(
              label: "Login",
              onPressed: () => goToWeDoCustomerApp(),
              // hideShadow: true,
            )
          ],
        ),
      ),
    );
  }

  goToWeDoCustomerApp() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        WeDoCustomerApp.routeName, (Route<dynamic> route) => false);
  }
}
