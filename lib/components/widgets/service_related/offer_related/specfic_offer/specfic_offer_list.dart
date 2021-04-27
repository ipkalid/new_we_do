import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specific_offer_card.dart';

import 'package:we_do/model/offer_model.dart';

class SpecficOfferList extends StatelessWidget {
  SpecficOfferList({@required this.offerList});
  final List<Offer> offerList;

  List<Widget> _addOfferList() {
    List<Widget> offers = [];
    for (var i = 0; i < offerList.length; i++) {
      offers.add(
        Padding(
          padding: EdgeInsets.only(
              top: i == 0 ? 30 : 12,
              bottom: i == (offerList.length - 1) ? 30 : 0),
          child: Center(
            child: SpecificOfferCard(
              offer: offerList[i],
            ),
          ),
        ),
      );
    }
    return offers;
  }

  @override
  Widget build(BuildContext context) {
    return (offerList.isNotEmpty)
        ? ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: _addOfferList(),
          )
        : ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height * .2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "There are no offers Now",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
