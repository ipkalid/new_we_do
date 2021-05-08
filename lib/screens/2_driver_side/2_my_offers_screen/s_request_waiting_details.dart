import 'package:flutter/material.dart';
import '../../../model/offer_model.dart';
import '../../../temp/components/customer_button.dart';
import '../../../temp/components/specific_request_details.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class SRequestWaitingDetails extends StatefulWidget {
  Offer theOffer;

  @override
  _SRequestWaitingDetailsState createState() => _SRequestWaitingDetailsState();
}

class _SRequestWaitingDetailsState extends State<SRequestWaitingDetails> {
  List<Padding> customerList = [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomerButton(
        onPressed: () {},
        customerName: "Leslie Alexander",
        rating: 4,
        building: "111",
        room: "211",
      ),
    ),
  ];
  String customerName;
  double rating;
  String orderName;
  double price;
  String time;

  @override
  void initState() {
    super.initState();
    customerName = "Saad Alshumrani";
    rating = 4;
    orderName = "Panda";
    price = 5.0;
    time = "11:30 PM";
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appbar = WedoAppBar();

    return Scaffold(
      appBar: appbar.appbar(
          title: "offer", onPressed: () => {}, pageContext: context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SpecificRequestDetails(
                  onPressed: () {},
                  customerName: customerName,
                  rating: rating,
                  orderName: orderName,
                  price: price,
                  time: time,
                ),
              ),
              Container(
                color: fieldBorderColor,
                child: Column(
                  children: [
                    Column(
                      children: customerList,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: MainButton(
                        onPressed: () {},
                        text: "Cancel",
                        buttonColor: Red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
