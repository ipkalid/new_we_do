import 'package:flutter/material.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/offer_screen.dart';
import 'package:we_do/screens/1_customer_side/2_my_requests_screen/my_requests_screen.dart';
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
  final void Function() loginAsDriverPressed;
  TabNavigator({
    this.navigatorKey,
    this.tabItem,
    @required this.logoutPressed,
    @required this.loginAsDriverPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (tabItem) {
      case "Offer":
        child = OfferScreen();
        break;

      case "My_Order":
        child = MyRequestsScreen();
        break;

      case "History":
        child = HistoryScreen();
        break;

      case "Account":
        child = AccountScreen(
          logoutPressed: logoutPressed,
          loginAsDriverPressed: loginAsDriverPressed,
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
