import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_do/screens/0_auth_screens/intro_screen.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';
import 'package:we_do/screens/2_driver_side/wedo_driver_app.dart';
import 'package:we_do/style/app_theme.dart';

var globalRoute;
void main() async {
  await Hive.initFlutter();
  Box currentUser = await Hive.openBox<String>("currentUser");

  String userId = currentUser.get("customerID");

  (userId == null)
      ? globalRoute = IntroScreen.routeName
      : globalRoute = WeDoCustomerApp.routeName;

  runApp(WeDoMain());
}

class WeDoMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.customerTheme,
      title: 'Wedo App',
      debugShowCheckedModeBanner: false,
      initialRoute: globalRoute,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        WeDoCustomerApp.routeName: (context) => WeDoCustomerApp(),
        WeDoDriverApp.routeName: (context) => WeDoDriverApp(),
      },
    );
  }
}
