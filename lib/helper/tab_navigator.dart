import 'package:flutter/material.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/offer_screen.dart';
import 'package:we_do/screens/1_customer_side/2_my_order_screens/my_order_screen.dart';
import 'package:we_do/screens/1_customer_side/4_history_screens/history_screen.dart';
import 'package:we_do/screens/1_customer_side/5_profile_screen/account_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final void Function() logoutPressed;
  TabNavigator({this.navigatorKey, this.tabItem, @required this.logoutPressed});

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (tabItem) {
      case "Offer":
        child = OfferScreen();
        break;

      case "My_Order":
        child = MyOrderScreen();
        break;

      case "History":
        child = HistoryScreen();
        break;

      case "Account":
        child = AccountScreen();
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
