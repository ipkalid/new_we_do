import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:we_do/model/offer_model.dart';
import '../../../model/offer_model.dart';
import '../../../model/request_model.dart';
import '../../../model/service_model.dart';
import '../../../temp/components/customer_button.dart';
import '../../../temp/components/specific_request_details.dart';
import 'g_offer_confirmed.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class GOfferConfirmedDetails extends StatefulWidget {
  //TODO: use service instead of theOffer ans requestList
  Offer theOffer;
  List<Service> servicesList;

  GOfferConfirmedDetails({this.servicesList, this.theOffer});

  @override
  //TODO: Use this constructor
  _GOfferConfirmedDetailsState createState() => _GOfferConfirmedDetailsState(
      servicesList: servicesList, theOffer: theOffer);
}

class _GOfferConfirmedDetailsState extends State<GOfferConfirmedDetails> {
  Offer theOffer;
  List<Service> servicesList;

  _GOfferConfirmedDetailsState({this.servicesList, this.theOffer});

  List<Padding> getServicesList(var context) {
    List<Padding> allServices = [];

    for (int i = 0; i < servicesList.length; i++) {
      final int x = i;
      print(servicesList);
      allServices.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomerButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SRequestConfirmed(servicesList[x].request);
                }));
              },
              customerName: servicesList[x].request.address.customer.name,
              rating: servicesList[x].request.address.customer.rating,
              building: servicesList[x].request.address.buildingNo,
              room: servicesList[x].request.address.room),
        ),
      );
    }

    return allServices;
  }

  Widget _buildPopupDialog(BuildContext context) {
    Service statusChange;
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
                      onPressed: () {
                        //TODO: Change the status of all requests
                        Navigator.pop(context);
                        setState(() {
                          theOffer.status = "To The Store";
                          for (int i = 0; i < servicesList.length; i++) {
                            servicesList[i].status = "To The Store";
                          }
                        });
                        changeAllServicesStatus(servicesList, "To The Store");
                      },
                      text: "To The Store",
                      buttonColor: Color(0xFF7AA4E3),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {
                        //TODO: Change the status of all requests
                        Navigator.pop(context);
                        setState(() {
                          theOffer.status = "At The Store";
                          for (int i = 0; i < servicesList.length; i++) {
                            servicesList[i].status = "At The Store";
                          }
                        });
                        changeAllServicesStatus(servicesList, "At The Store");
                      },
                      text: "At The Store",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {
                        //TODO: Change the status of all requests
                        Navigator.pop(context);
                        setState(() {
                          theOffer.status = "To The Camp";
                          for (int i = 0; i < servicesList.length; i++) {
                            servicesList[i].status = "To The Camp";
                          }
                        });
                        changeAllServicesStatus(servicesList, "To The Camp");
                      },
                      text: "To The Camp",
                      textColor: Colors.black,
                      buttonColor: Color(0xFFEFEFEF),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  // TODO: FIX THE SERVICE PROBLEM
  void changeAllServicesStatus(List<Service> listOfServices, newStatus) {
    for (int i = 0; i < listOfServices.length; i++) {
      Service.changeStatus(listOfServices[i].serviceID, newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appbar = WedoAppBar();
    String theOfferStatus = theOffer.status;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Offer",
          style: TextStyle(
              color: Colors.black,
              fontSize: 0.055 * displayWidth(context),
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xFF7AA4E3),
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
              child: Column(
                children: [
                  SpecificRequestDetails(
                    onPressed: () {},
                    customerName: theOffer.driver.customer
                        .name, //allRequests[0].offer.driver.customer.name
                    rating: theOffer
                        .driver.rating, //allRequests[0].offer.driver.rating
                    orderName:
                        "${theOffer.locationName}", //allRequests[0].offer.locationName
                    price: theOffer
                        .deliveryPrice, //allRequests[0].offer.deliveryPrice
                    time:
                        "${theOffer.deliveryTime}", //allRequests[0].offer.deliveryTime
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Status: $theOfferStatus",
                    style: TextStyle(
                        fontSize: 0.045 * displayWidth(context),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: fieldBorderColor,
                // TODO: MOVE TO CONSTANTS
                //height: 0.4 * displayHeight(context),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: getServicesList(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 0),
                      child: MainButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context),
                          );
                        },
                        text: "Change Status",
                        buttonColor: mainOrange,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
