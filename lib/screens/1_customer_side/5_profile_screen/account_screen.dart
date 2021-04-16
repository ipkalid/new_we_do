import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/setting_button.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);
  

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(""),
            radius: 48,
          ),
          SizedBox(height: 32),
          SettingButton(
            label: "Profile",
            icon: Icons.person_outline,
            onPressed: () => "onPressed",
          ),
          SizedBox(height: 25),
          SettingButton(
            label: "Wallet",
            icon: Icons.account_balance_wallet_outlined,
            onPressed: () => "onPressed",
          ),
          SizedBox(height: 25),
          SettingButton(
            label: "Terms and Conditions",
            icon: Icons.description_outlined,
            onPressed: () => "onPressed",
          ),
          SizedBox(height: 25),
          SettingButton(
            label: "About Us",
            icon: Icons.info_outline,
            onPressed: () => "onPressed",
          ),
          SizedBox(height: 25),
          SettingButton(
            label: "Log in as Driver",
            icon: Icons.directions_car_outlined,
            onPressed: () => "onPressed",
          ),
          SizedBox(height: 25),
          SettingButton(
            label: "Log Out",
            icon: Icons.logout,
            onPressed: () => "onPressed",
          ),
        ],
      ),
    );
  }
}
