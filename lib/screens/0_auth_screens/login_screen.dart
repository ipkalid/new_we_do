import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/customer_model.dart';
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
  String error = "";
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
                    keyboardType: TextInputType.number,
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
            Text(error),
            SizedBox(height: 64),
            ActionButton(
              label: "Login",
              onPressed: () => getSignIn(),
              // hideShadow: true,
            )
          ],
        ),
      ),
    );
  }

  getSignIn() async {
    String phonenumber = '966' + phoneNumberController.text;
    {
      Customer response = await Customer.signIn(phonenumber);

      if (phonenumber == response.phoneNumber &&
          passwordController.text == response.password) {
        Box currentUser = await Hive.openBox<String>("currentUser");
        // Assigning the user info to the hive database (aka offline database)
        currentUser.put("customerID", response.customerID);
        globalUserId = response.customerID;
        currentUser.put("phoneNumber", response.phoneNumber);
        globalPhoneNumber = response.phoneNumber;
        currentUser.put("walletID", response.walletID);
        globalWalletId = response.walletID;

        goToWeDoCustomerApp();
      } else {
        setState(() {
          error = 'Invalid password or phone number';
        });
      }
    }
  }

  goToWeDoCustomerApp() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        WeDoCustomerApp.routeName, (Route<dynamic> route) => false);
  }
}
