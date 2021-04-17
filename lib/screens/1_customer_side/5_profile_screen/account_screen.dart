import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/setting_button.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen(
      {Key key,
      @required this.logoutPressed,
      @required this.loginAsDriverPressed})
      : super(key: key);
  final void Function() logoutPressed;
  final void Function() loginAsDriverPressed;

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
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
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
          SettingButton(
            label: "Wallet",
            icon: Icons.account_balance_wallet_outlined,
            onPressed: () => "onPressed",
          ),
          SettingButton(
            label: "Terms and Conditions",
            icon: Icons.description_outlined,
            onPressed: () => "onPressed",
          ),
          SettingButton(
            label: "About Us",
            icon: Icons.info_outline,
            onPressed: () => "onPressed",
          ),
          SettingButton(
            label: "Log in as Driver",
            icon: Icons.directions_car_outlined,
            onPressed: () => widget.loginAsDriverPressed,
          ),
          SettingButton(
            label: "Log Out",
            icon: Icons.logout,
            onPressed: () => _onLogout(context),
          ),
        ],
      ),
    );
  }

  void _onLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text("Logout?"),
        content: new Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            child: Text(
              "CANCEL",
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: new Text(
              "Yes",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.logoutPressed();
            },
          )
        ],
      ),
    );
  }
}
