import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/style/app_color.dart';

class SpecificOfferCard extends StatefulWidget {
  SpecificOfferCard({this.offer, this.fromServiceScreen = false});
  final Offer offer;
  final bool fromServiceScreen;

  @override
  _SpecificOfferCardState createState() => _SpecificOfferCardState();
}

class _SpecificOfferCardState extends State<SpecificOfferCard> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [AppColor.shadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                (widget.offer.driver.customer.picURL != null)
                    ? "${widget.offer.driver.customer.picURL}"
                    : "",
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.offer.driver.customer.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    if (!widget.fromServiceScreen)
                      Text(
                        "Price ${widget.offer.deliveryPrice} SR",
                        style: TextStyle(fontSize: 18),
                      )
                  ],
                ),
              ),
            ),
            if (!widget.fromServiceScreen)
              SizedBox(
                width: 96,
                child: ActionButton(
                  label: "Accept",
                  active: isActive,
                  onPressed: () => putAcceptOffer(),
                  color: Color(0xff7DAD40),
                  hideShadow: true,
                ),
              )
          ],
        ),
      ),
    );
  }

  void putAcceptOffer() {
    Offer.acceptSpecificOffer(widget.offer.offerID);
    setState(() {
      isActive = false;
    });
  }
}
