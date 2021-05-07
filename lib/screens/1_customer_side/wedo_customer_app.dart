import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/components/fab_bottom_app_bar/fab_bottom_app_bar.dart';
import 'package:we_do/components/fab_bottom_app_bar/layout.dart';
import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/customer_model.dart';
import 'package:we_do/screens/1_customer_side/tab_navigator.dart';
import 'package:we_do/screens/0_auth_screens/intro_screen.dart';
import 'package:we_do/screens/1_customer_side/3_new_request/1_general_request/new_general_request_details_screen.dart';
import 'package:we_do/screens/2_driver_side/wedo_driver_app.dart';
import 'package:we_do/style/app_color.dart';
import 'package:we_do/style/app_theme.dart';

class WeDoCustomerApp extends StatefulWidget {
  static const routeName = '/wedo-customer-app';
  @override
  _WeDoCustomerAppState createState() => _WeDoCustomerAppState();
}

class _WeDoCustomerAppState extends State<WeDoCustomerApp> {
  void _goToLogOut(BuildContext context) async {
    Box currentUser = await Hive.openBox<String>("currentUser");
    currentUser.delete("customerID");
    currentUser.delete("phoneNumber");
    currentUser.delete("walletID");
    Navigator.pushReplacementNamed(context, IntroScreen.routeName);
  }

  void _goToDriverSide(BuildContext context) async {
    print(globalKfupmMail);

    Customer.activateDriverSide(globalDriverId, globalKfupmMail);
    //Navigator.pushReplacementNamed(context, WeDoDriverApp.routeName);
  }

  String _currentPage = "Offer";
  List<String> pageKeys = ["Offer", "My_Order", "History", "Account"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Offer": GlobalKey<NavigatorState>(),
    "My_Order": GlobalKey<NavigatorState>(),
    "History": GlobalKey<NavigatorState>(),
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
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        logoutPressed: () {
          _goToLogOut(context);
        },
        loginAsDriverPressed: () {
          _goToDriverSide(context);
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
        theme: AppTheme.customerTheme,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              _buildOffstageNavigator("Offer"),
              _buildOffstageNavigator("My_Order"),
              _buildOffstageNavigator("History"),
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
          builder: (context) => NewGeneralRequstDetailsScreen(),
          fullscreenDialog: true),
    );
  }
}
