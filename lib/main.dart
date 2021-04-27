import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:we_do/screens/0_auth_screens/intro_screen.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';
import 'package:we_do/screens/2_driver_side/wedo_driver_app.dart';
import 'package:we_do/style/app_theme.dart';

void main() async {
  await Hive.initFlutter();
  //TODO: LATER
  //await UserPreferences().getToken();
  // (global.token == null)
  //     ? global.route = IntroScreen.routeName
  //     : global.route = WeDoApp.routeName;
  runApp(WeDoMain());
}

class WeDoMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.customerTheme,
      //darkTheme: kDarkTheme,
      title: 'We do App',
      debugShowCheckedModeBanner: false,

      //home: TestClass(),
      initialRoute: IntroScreen.routeName,
      // initialRoute: global.route,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        WeDoCustomerApp.routeName: (context) => WeDoCustomerApp(),
        WeDoDriverApp.routeName: (context) => WeDoDriverApp(),
      },
    );
  }
}
