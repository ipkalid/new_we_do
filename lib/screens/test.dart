import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: FocusDetector(
        onFocusGained: () {
          //Do Somthing
        },
        child: Container(
          child: Text("Example"),
        ),
      ),
    );
  }
}
