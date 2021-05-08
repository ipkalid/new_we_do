import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/components/fab_bottom_app_bar/fab_bottom_app_bar.dart';
import 'package:we_do/components/fab_bottom_app_bar/layout.dart';
import 'package:we_do/screens/0_auth_screens/intro_screen.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';
import 'package:we_do/screens/2_driver_side/3_new_offer/1_general_offer/new_offer_screen.dart';
import 'package:we_do/screens/2_driver_side/tab_navigator_driver.dart';
import 'package:we_do/style/app_color.dart';
import 'package:we_do/style/app_theme.dart';

class WeDoDriverApp extends StatefulWidget {
  static const routeName = '/wedo-driver-app';
  @override
  _WeDoDriverAppState createState() => _WeDoDriverAppState();
}

class _WeDoDriverAppState extends State<WeDoDriverApp> {
  void _goToLogOut(BuildContext context) async {
    Box currentUser = await Hive.openBox<String>("currentUser");
    currentUser.delete("customerID");
    currentUser.delete("phoneNumber");
    currentUser.delete("walletID");
    currentUser.delete("driverID");
    Navigator.pushReplacementNamed(context, IntroScreen.routeName);
  }

  String _currentPage = "Offer";
  List<String> pageKeys = ["Offer", "My_Order", "Wallet", "Account"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Offer": GlobalKey<NavigatorState>(),
    "My_Order": GlobalKey<NavigatorState>(),
    "Wallet": GlobalKey<NavigatorState>(),
    "Account": GlobalKey<NavigatorState>(),
  };

  // void _onItemTapped(String tabItem, int index) {
  //   if (tabItem == _currentPage) {
  //     _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() {
  //       _currentPage = pageKeys[index];
  //     });
  //   }
  // }

  void _onItemTapped(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        // _selectedIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigatorDriverSide(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        logoutPressed: () {
          _goToLogOut(context);
        },
        loginAsCustomerPressed: () {
          Navigator.pushReplacementNamed(context, WeDoCustomerApp.routeName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Offer") {
            _onItemTapped("Offer", 0);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: MaterialApp(
        theme: AppTheme.driverTheme,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              _buildOffstageNavigator("Offer"),
              _buildOffstageNavigator("My_Order"),
              _buildOffstageNavigator("Wallet"),
              _buildOffstageNavigator("Account"),
            ],
          ),
          bottomNavigationBar: FABBottomAppBar(
            color: Colors.grey,
            selectedColor: AppColor.kOrange,
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: (int index) => _onItemTapped(pageKeys[index], index),
            items: [
              FABBottomAppBarItem(iconData: Icons.drive_eta, text: 'Offer'),
              FABBottomAppBarItem(
                  iconData: Icons.local_mall_rounded, text: 'Orders'),
              FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
              FABBottomAppBarItem(
                  iconData: Icons.account_circle, text: 'Profile'),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFab(context),
          // floatingActionButton: _buildFab(context),
        ),
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 0.0),
        );
      },
      child: FloatingActionButton(
        highlightElevation: 0,
        disabledElevation: 0,
        backgroundColor: Colors.white,
        onPressed: () => goToNewRequest(),
        child: new LayoutBuilder(builder: (context, constraint) {
          return new Icon(
            Icons.add_circle_outline,
            size: constraint.biggest.height - 2,
            color: AppColor.kOrange,
          );
        }),
        elevation: 2.0,
      ),
    );
  }

  void goToNewRequest() async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewOfferScreen(), fullscreenDialog: true),
    );
  }
}
