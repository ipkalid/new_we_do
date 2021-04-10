import 'package:flutter/material.dart';
import 'package:we_do/model/service_model.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key key}) : super(key: key);

  //TODO Future History;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<List<Service>> futureListServices;

  void _getServices() {
    //futureListServices =
  }

  @override
  void initState() {
    super.initState();
    _getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [],
      ),
    );
  }
}
