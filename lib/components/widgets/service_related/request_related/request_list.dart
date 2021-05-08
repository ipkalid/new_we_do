import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_card.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';

class RequestList extends StatelessWidget {
  RequestList(
      {this.requestList, this.serviceList, this.fromDriverSide = false});
  final List<Request> requestList;
  final List<Service> serviceList;
  final bool fromDriverSide;

  List<Widget> _addRequestsList() {
    List<Widget> requestCardsList = [];
    List requestListt = [];
    (requestList == null)
        ? requestListt = serviceList
        : requestListt = requestList;

    for (var i = 0; i < requestListt.length; i++) {
      requestCardsList.add(
        Padding(
          padding: EdgeInsets.only(
              top: i == 0 ? 30 : 12,
              bottom: i == (requestListt.length - 1) ? 30 : 0),
          child: Center(
            child: (requestList == null)
                ? RequestCard(
                    service: requestListt[i],
                    fromDriverSide: fromDriverSide,
                  )
                : RequestCard(
                    request: requestListt[i],
                    fromDriverSide: fromDriverSide,
                  ),
          ),
        ),
      );
    }
    return requestCardsList;
  }

  @override
  Widget build(BuildContext context) {
    List requestListt = [];
    (requestList == null)
        ? requestListt = serviceList
        : requestListt = requestList;
    return (requestListt.isNotEmpty)
        ? ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: _addRequestsList(),
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
