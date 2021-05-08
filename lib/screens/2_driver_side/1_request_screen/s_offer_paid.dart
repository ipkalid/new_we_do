import 'package:flutter/material.dart';
import '../../../temp/components/specific_offer_details.dart';
import '../../../temp/components/detail.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class SOfferPaid extends StatefulWidget {
  @override
  _SOfferPaidState createState() => _SOfferPaidState();
}

class _SOfferPaidState extends State<SOfferPaid> {
  String customerName;
  int rating;
  String orderName;
  int building;
  int room;
  double cost;
  double deliveryPrice;
  String summary;

  @override
  void initState() {
    super.initState();
    customerName = "Saad Alshumrani";
    rating = 4;
    orderName = "Panda";
    building = 822;
    room = 312;
    cost = 32;
    deliveryPrice = 15;
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
                      child: SpecificOfferDetails(
                        onPressed: () {},
                        customerName: customerName,
                        rating: rating,
                        orderName: orderName,
                        building: building,
                        room: room,
                      ),
                    ),
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
