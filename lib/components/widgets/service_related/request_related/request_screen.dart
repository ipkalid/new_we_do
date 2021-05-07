import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specfic_offer_list.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specific_offer_card.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';

class RequestScreen extends StatefulWidget {
  RequestScreen({@required this.request});
  final Request request;

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  Future<List<Offer>> futureOfferList;
  void _getOffer() {
    futureOfferList = Request.getAllSpecificOffers(widget.request.requestID);
  }

  @override
  void initState() {
    super.initState();

    if (widget.request.isSpecific == 0) _getOffer();
  }

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
                    onPressed: () => _putCancelRequest(),
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
          if (widget.request.isSpecific == 0)
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
          if (widget.request.isSpecific == 0)
            Expanded(
              child: FutureBuilder(
                future: futureOfferList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SpecficOfferList(
                      offerList: snapshot.data,
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
            )
        ],
      ),
    );
  }

  _putCancelRequest() async {
    Request.cancelRequest(widget.request.requestID);
    Navigator.pop(context);
  }
}
