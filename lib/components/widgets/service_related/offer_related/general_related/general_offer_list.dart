import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_card.dart';

import 'package:we_do/model/offer_model.dart';

class GeneralOfferList extends StatelessWidget {
  GeneralOfferList({@required this.offerList, this.fromDriverSide = false});
  final List<Offer> offerList;
  final fromDriverSide;

  List<Widget> _addOfferList() {
    List<Widget> offers = [];
    for (var i = 0; i < offerList.length; i++) {
      offers.add(
        Padding(
          padding: EdgeInsets.only(
              top: i == 0 ? 30 : 12,
              bottom: i == (offerList.length - 1) ? 30 : 0),
          child: Center(
            child: GeneralOfferCard(
              offer: offerList[i],
              fromDriverSide: fromDriverSide,
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
