import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms And Conditions"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pretium nec a arcu gravida eget tortor vitae sit sed. Eu, ultrices commodo aliquam a tempor vulputate risus, sed. Sed penatibus accumsan ut faucibus nunc, sapien vulputate metus. Elit, posuere at vestibulum quam consequat tempor pulvinar non, nunc.",
          ),
        ),
      ),
    );
  }
}
