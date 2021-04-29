import 'package:flutter/material.dart';
import '../../../helper/hive_preferences.dart';
import '../../../model/offer_model.dart';
import '../../../model/service_model.dart';

class MyOffersScreen extends StatefulWidget {
  MyOffersScreen({Key key}) : super(key: key);

  @override
  _MyOffersScreenState createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  Future<List<Offer>> futureRequestsList;
  Future<List<Service>> futureServicesList;

  void _getOffersList() {
    futureRequestsList = Offer.getMyWaitingRequests(globalUserId);
  }

  void _getServicesList() {
    futureServicesList = Service().getCustomerServices(globalUserId);
  }

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
                // RequestCard(
                //   request: requestttt,
                // )
              ],
            ),
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                // RequestCard(
                //   service: serviceeee,
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
