import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({Key key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: Center(
        child: Text("MyOrderScreen"),
      ),
    );
  }
}
