import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../model/service_model.dart';
import '../../../temp/components/s_request_details.dart';
import '../../../temp/components/detail.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class GRequestPaid extends StatefulWidget {
  Service theService;

  GRequestPaid({this.theService});

  @override
  _GRequestPaidState createState() => _GRequestPaidState();
}

class _GRequestPaidState extends State<GRequestPaid> {
  Service theService;

  _GRequestPaidState({this.theService});

  String customerName;
  double rating;
  String building;
  String room;
  double cost;
  double deliveryPrice;
  String summary;

  @override
  void initState() {
    super.initState();
    customerName = theService.request.address.customer.name;
    rating = theService.request.address.customer.rating;
    building = theService.request.address.buildingNo;
    room = theService.request.address.room;
    cost = theService.orderCost as double;
    deliveryPrice = theService.offer.deliveryPrice;
    double total = cost + deliveryPrice;
    summary =
        "\nCost: $cost SAR\n\nDelivery: $deliveryPrice SAR\n\nTotal: $total SAR";
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appbar = WedoAppBar();
    return MaterialApp(
      home: Builder(
        builder: (context) => SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Request",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.055 * displayWidth(context),
                    fontWeight: FontWeight.w500),
              ),
            ),
            backgroundColor: Color(0xFF7AA4E3),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: SRequestDetails(
                          customerName: customerName,
                          rating: rating,
                          building: building,
                          room: room,
                        )),
                  ),
                  Detail(
                    detail:
                        "my order: \n1- xxxxxx\n2- xxxxxxx\n3- xxxxxx\n\n$summary",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: MainButton(
                      onPressed: () {},
                      text: "Done",
                      buttonColor: Green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            //currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            //onTap: _onItemTapped,
          ),
        )),
      ),
    );
  }
}
