import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/model/offer_model.dart';

class OfferCard extends StatelessWidget {
  OfferCard({this.offer, this.fromServiceScreen = false});
  final Offer offer;
  final bool fromServiceScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .2),
            blurRadius: 8,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80"),
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
                      offer.driver.customer.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    if (!fromServiceScreen)
                      Text(
                        "Price ${offer.deliveryPrice} SR",
                        style: TextStyle(fontSize: 18),
                      )
                  ],
                ),
              ),
            ),
            if (!fromServiceScreen)
              SizedBox(
                width: 96,
                child: ActionButton(
                  label: "Accept",
                  onPressed: () => "",
                  color: Color(0xff7DAD40),
                  hideShadow: true,
                ),
              )
          ],
        ),
      ),
    );
  }
}
