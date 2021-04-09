import 'package:flutter/material.dart';
import 'package:we_do/screens/0_auth_screens/components/intro_messages_model.dart';

class IntroList extends StatelessWidget {
  IntroList({
    this.onPageChanged,
    @required this.messages,
    this.pageController,
  });
  final List<IntroMessage> messages;
  final Function(int) onPageChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    messages[index].title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    messages[index].description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      controller: pageController,
      itemCount: messages.length,
      onPageChanged: onPageChanged,
    );
  }
}
