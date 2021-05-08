import 'package:flutter/material.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';
import '../../../model/offer_model.dart';
import '../../../model/request_model.dart';
import '../../../temp/components/customer_button.dart';
import '../../../temp/components/specific_request_details.dart';
import 's_request_waiting_details.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class GOfferWaitingDetails extends StatefulWidget {
  Offer theOffer;
  List<Request> requestsList;

  GOfferWaitingDetails({this.theOffer, this.requestsList});

  @override
  _GOfferWaitingDetailsState createState() => _GOfferWaitingDetailsState(
      theOffer: theOffer, requestsList: requestsList);
}

class _GOfferWaitingDetailsState extends State<GOfferWaitingDetails> {
  Offer theOffer;
  List<Request> requestsList;

  _GOfferWaitingDetailsState({this.theOffer, this.requestsList});

  List<Padding> getRequestsList(var context) {
    List<Padding> allRequests = [];

    for (int i = 0; i < requestsList.length; i++) {
      allRequests.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomerButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SRequestWaitingDetails()));
              },
              customerName: requestsList[i].deliverFrom,
              // TODO: requestsList[i].address.customer.rating (PUT THIS DOWN HERE)
              rating: 0,
              // TODO: fix the below later after the merge with khalid
              building: "requestsList[i].address.buildingNo",
              room: "requestsList[i].address.room"),
        ),
      );
    }

    return allRequests;
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appbar = WedoAppBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('Offer'),
      ),
      body: Center(
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
                customerName: "theOffer.driver.customer.name",
                // TODO: theOffer.driver.rating (PUT THIS DOWN HERE)
                rating: 0,
                orderName: theOffer.locationName,
                price: theOffer.deliveryPrice,
                time: theOffer.deliveryTime,
              ),
            ),
            Container(
              color: fieldBorderColor,
              // TODO: MOVE TO CONSTANTS
              height: 0.65 * displayHeight(context),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: getRequestsList(context),
                    ),
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
    );
  }
}
