import 'package:flutter/material.dart';
import '../../../temp/components/specific_offer_details.dart';
import '../../../temp/components/text_field_with_label.dart';
import '../../../temp/components/detail.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class SOfferDetails extends StatefulWidget {
  @override
  _SOfferDetailsState createState() => _SOfferDetailsState();
}

class _SOfferDetailsState extends State<SOfferDetails> {
  String customerName;
  int rating;
  String orderName;
  int building;
  int room;
  double deliveryPrice;

  @override
  void initState() {
    super.initState();
    customerName = "Saad Alshumrani";
    rating = 4;
    orderName = "Panda";
    building = 840;
    room = 124;
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appbar = WedoAppBar();
    return Builder(
      builder: (context) => SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "New Requests",
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
                    padding: const EdgeInsets.all(8.0),
                    child: SpecificOfferDetails(
                      onPressed: () {},
                      customerName: customerName,
                      rating: rating,
                      orderName: orderName,
                      building: building,
                      room: room,
                    )),
                SizedBox(
                  height: 20,
                ),
                Detail(
                  detail: "my order: \n1- xxxxxx\n2- xxxxxxx\n 3- xxxxxx",
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: TextFieldWithLabel(
                    onChanged: (value) {
                      if (value.length > 0) {
                        deliveryPrice = double.parse(value);
                      } else {
                        deliveryPrice = 0;
                      }
                    },
                    label: "Delivery Price",
                    inputType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: MainButton(
                    onPressed: () {},
                    text: "Send an Offer",
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
    );
  }
}
