import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/service_related/chat_screen.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_card.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specfic_offer_list.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specific_offer_card.dart';
import 'package:we_do/components/widgets/service_related/request_related/general_request/general_request_lst.dart';
import 'package:we_do/components/widgets/service_related/track_screen.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';

class OfferDetails extends StatefulWidget {
  OfferDetails({this.service, this.offer});
  final Service service;
  final Offer offer;

  @override
  _OfferDetailsState createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  Future<List<Request>> futureOfferList;

  void _getOffer() {
    futureOfferList = Offer.getAllSpecificRequests(widget.offer.offerID);
  }

  @override
  void initState() {
    super.initState();
    _getOffer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(title: Text("Order")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GeneralOfferCard(
              offer:
                  (widget.offer == null) ? widget.service.offer : widget.offer,
              isDialog: true,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: futureOfferList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SpecficOfferList(
                    requestList: snapshot.data,
                  );
                } else if (snapshot.hasError) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Text("Error"),
                    ],
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 188,
                      child: ActionButton(
                          label: "Cancel",
                          hideShadow: true,
                          color: Colors.red,
                          onPressed: () {
                            Offer.cancelOffer(widget.offer.offerID)
                                .then((value) => Navigator.pop(context));
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _goToTrackScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceTrackScreen(
          service: widget.service,
        ),
      ),
    );
  }
}
