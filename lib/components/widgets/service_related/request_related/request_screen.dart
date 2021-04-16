import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/service_related/offer_related/offer_card.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';

class RequestScreen extends StatefulWidget {
  RequestScreen({@required this.request});
  final Request request;

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.request.deliverFrom,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ActionButton(
                    label: "Cancel",
                    onPressed: () => "",
                    color: Colors.red,
                    hideShadow: true,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Color(0xffEFEFEF),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.request.description,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Offers",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              OfferCard(
                offer: offereeeee,
              )
            ],
          ))
        ],
      ),
    );
  }
}
