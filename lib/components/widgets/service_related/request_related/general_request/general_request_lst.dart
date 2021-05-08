import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_card.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_card.dart';

import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';

import 'general_request_card.dart';

class GeneralRequestList extends StatelessWidget {
  GeneralRequestList({@required this.requestsList});
  final List<Request> requestsList;

  List<Widget> _addOfferList() {
    List<Widget> requests = [];
    for (var i = 0; i < requestsList.length; i++) {
      requests.add(
        Padding(
          padding: EdgeInsets.only(
              top: i == 0 ? 30 : 12,
              bottom: i == (requestsList.length - 1) ? 30 : 0),
          child: Center(
            child: GeneralRequestCard(
              request: requestsList[i],
            ),
          ),
        ),
      );
    }
    return requests;
  }

  @override
  Widget build(BuildContext context) {
    return (requestsList.isNotEmpty)
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
                      "There are no requests Now",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
