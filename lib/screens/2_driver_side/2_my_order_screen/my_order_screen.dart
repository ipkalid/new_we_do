import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_card.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';

class MyOrderScreen extends StatefulWidget {
  MyOrderScreen({Key key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Orders"),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: "Waiting",
              ),
              Tab(
                text: "Confirmed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                RequestCard(
                  request: requestttt,
                )
              ],
            ),
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                RequestCard(
                  service: serviceeee,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
