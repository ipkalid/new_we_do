import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            tooltip: 'Show Lost',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Center(
        child: Text("MyOfferScreen"),
      ),
    );
  }
}
