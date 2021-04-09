import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/config/image_path.dart';
import 'package:we_do/screens/0_auth_screens/components/intro_list.dart';
import 'package:we_do/screens/0_auth_screens/components/intro_messages_model.dart';
import 'package:we_do/screens/0_auth_screens/login_screen.dart';
import 'package:we_do/screens/0_auth_screens/signup_screen.dart';

import 'package:we_do/style/text_style_theme.dart';
import 'package:we_do/style/theme.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro-screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYello,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImagePath.logo,
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .5,
            ),
            Expanded(
              child: IntroList(
                messages: introMessages,
                pageController: pageController,
                onPageChanged: (index) => _updateIndicator(index),
              ),
            ),
            if (_lastPage())
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 5),
                      child: ActionButton(
                        label: "Log In",
                        onPressed: () => _goToLogInScreen(),
                        hideShadow: true,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "First Time Here?",
                          style: TextStyleTheme.introOrangeText,
                        ),
                        TextButton(
                            onPressed: () => _goToSignUpScreen(),
                            child: Text(
                              "Sign Up.",
                              style: TextStyleTheme.introPressedText,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  indicator(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: introMessages.map(
        (message) {
          var index = introMessages.indexOf(message);
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? Colors.white : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }

  void _updateIndicator(int index) {
    setState(
      () {
        currentPage = index;
      },
    );
  }

  bool _lastPage() {
    return (currentPage == introMessages.length - 1);
  }

  _goToLogInScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  _goToSignUpScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
        fullscreenDialog: true,
      ),
    );
  }
}
