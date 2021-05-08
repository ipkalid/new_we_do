import 'package:flutter/material.dart';
import 'filter_related/filter_bottom_sheet.dart';
import '../../../temp/components/specific_offer_popup.dart';
import '../../../temp/components/specific_offer.dart';

import '../../../temp/components/main_button.dart';

class SpecificOfferList extends StatefulWidget {
  @override
  _SpecificOfferListState createState() => _SpecificOfferListState();
}

class _SpecificOfferListState extends State<SpecificOfferList> {
  double deliveryPrice;

  Widget _buildPopupDialog(BuildContext context, List details) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: MaterialButton(
                        height: 0,
                        minWidth: 0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close)),
                  ),
                  SpecificOfferPopup(
                    onPressed: () {},
                    customerName: details[0],
                    rating: details[1],
                    orderName: details[2],
                    building: details[3],
                    room: details[4],
                    onChanged: (value) {
                      if (value.length > 0) {
                        deliveryPrice = double.parse(value);
                      } else {
                        deliveryPrice = 0;
                      }
                      print(deliveryPrice);
                      //print(value.toString());
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: MainButton(onPressed: () {}, text: "Make an Offer"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Padding> getSpecificOffers(var context) {
    List<Padding> specificOffers = [];

    //get the data from the API
    List<String> customer = ["Saad Alshumrani", "Ahmed Alharby"];
    List orderName = ['Panda', 'Super Market'];
    List rating = [5, 4];
    List<int> building = [858, 840];
    List<int> room = [123, 221];

    int i = -1;
    while (i < customer.length - 1) {
      i++;
      final int x = i;
      specificOffers.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: SpecificOffer(
              onPressed: () {
                List offersDetail = [
                  customer[x],
                  rating[x],
                  orderName[x],
                  building[x],
                  room[x]
                ];
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, offersDetail),
                );
              },
              customerName: customer[i],
              rating: rating[i],
              orderName: orderName[i],
              building: building[i],
              room: room[i])));
    }
    return specificOffers;
  }

  _showFilter() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (ctx) {
        return FilterBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("search")),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(
                  onPressed: () {
                    _showFilter();
                  },
                  text: "Filter",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: getSpecificOffers(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
