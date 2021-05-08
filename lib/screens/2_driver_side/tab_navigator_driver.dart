import 'package:flutter/material.dart';
import 'package:we_do/screens/2_driver_side/1_request_screen/request_screen.dart';
import 'package:we_do/screens/2_driver_side/2_my_offers_screen/my_offers_screen.dart';
import 'package:we_do/screens/2_driver_side/4_wallet_screen/wallet_screen.dart';
import 'package:we_do/screens/2_driver_side/5_profile_screen.dart/account_screen.dart';

class TabNavigatorDriverSide extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final void Function() logoutPressed;
  final void Function() loginAsCustomerPressed;
  TabNavigatorDriverSide({
    this.navigatorKey,
    this.tabItem,
    @required this.logoutPressed,
    @required this.loginAsCustomerPressed,
    //Null Function() loginAsDriverPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (tabItem) {
      case "Offer":
        child = RequestsScreen();
        break;

      case "My_Order":
        child = MyOffersScreen();
        break;

      case "Wallet":
        child = WalletScreen();
        break;

      case "Account":
        child = AccountScreen(
          logoutPressed: logoutPressed,
          loginAsDriverPressed: loginAsCustomerPressed,
        );
        break;
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
