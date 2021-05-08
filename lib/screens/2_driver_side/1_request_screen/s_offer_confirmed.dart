import 'package:flutter/material.dart';
import '../../../temp/components/specific_offer_details.dart';
import '../../../temp/components/detail.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class SOfferConfirmed extends StatefulWidget {
  @override
  _SOfferConfirmedState createState() => _SOfferConfirmedState();
}

class _SOfferConfirmedState extends State<SOfferConfirmed> {
  String customerName;
  int rating;
  String orderName;
  int building;
  int room;

  Widget _buildPopupDialog(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Status",
                      style: TextStyle(
                          fontSize: 0.05 * displayWidth(context),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "To The Store",
                      buttonColor: Color(0xFF7AA4E3),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "At The Store",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "To The Camp",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "On The Way",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "Delivered",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {},
                      text: "Canceled",
                      buttonColor: Red,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    customerName = "Saad Alshumrani";
    rating = 4;
    orderName = "Panda";
    building = 822;
    room = 312;
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
                    detail: "my order: \n1- xxxxxx\n2- xxxxxxx\n 3- xxxxxx",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: Column(
                      children: [
                        MainButton(
                          onPressed: () {},
                          text: "Assign bill",
                          buttonColor: Green,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MainButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          text: "Change status",
                          buttonColor: Green,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MainButton(
                          onPressed: () {},
                          text: "Chat",
                          buttonColor: Green,
                        ),
                        //MainButton(onPressed: (){}, text: "Cancel", buttonColor: Red,),
                      ],
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
