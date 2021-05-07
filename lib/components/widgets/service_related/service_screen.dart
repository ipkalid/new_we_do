import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/service_related/offer_related/specfic_offer/specific_offer_card.dart';
import 'package:we_do/components/widgets/service_related/track_screen.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/service_model.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({@required this.service});
  final Service service;

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
                    widget.service.request.deliverFrom,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ActionButton(
                    label: "Cancel",
                    onPressed: () =>
                        (widget.service.status == "new") ? print("") : null,
                    color: (widget.service.status == "new")
                        ? Colors.red
                        : Colors.grey,
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
                    widget.service.request.description,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "Driver",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SpecificOfferCard(
                  offer: widget.service.offer,
                  fromServiceScreen: true,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                // SpecificOfferCard(
                //   offer: offereeeee,
                //   fromServiceScreen: true,
                // ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment details:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cost:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          Text(
                            (widget.service.orderCost == null)
                                ? "Not Yet"
                                : "${widget.service.orderCost} SR",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                          Text(
                            "${widget.service.offer.deliveryPrice} SR",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Payment:",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            (widget.service.orderCost == null)
                                ? "${widget.service.offer.deliveryPrice}"
                                : "${widget.service.offer.deliveryPrice + widget.service.orderCost}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 94,
                      child: ActionButton(
                        label: "Track",
                        hideShadow: true,
                        color: Color(0xff7DAD40),
                        onPressed: () => _goToTrackScreen(),
                      ),
                    ),
                    SizedBox(width: 32),
                    SizedBox(
                      width: 94,
                      child: ActionButton(
                        label: "Chat",
                        hideShadow: true,
                        color: Color(0xff7DAD40),
                        onPressed: () {},
                      ),
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
