import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/helper/helper_method.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/screens/1_customer_side/3_new_request/2_specfic_request/new_specfic_request_screen.dart';
import 'package:we_do/style/app_color.dart';

class GeneralOfferCard extends StatelessWidget {
  GeneralOfferCard({Key key, this.offer, this.isDialog = false})
      : super(key: key);
  final Offer offer;
  final bool isDialog;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HelperMethods.showSimpleDialog(
          context: context,
          child: MakeAnOfferDialog(
            offer: offer,
            onPressed: () => _goTonewGeneralRequest(context),
          )),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        height: 170,
        decoration: BoxDecoration(
          color: isDialog ? Colors.white : Color(0xffFAFAFA),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: isDialog ? null : [AppColor.shadow],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("${offer.driver.customer.picURL}"),
                      radius: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      offer.driver.customer.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.food_bank,
                        size: 48,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      offer.locationName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${offer.deliveryPrice} SAR",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${offer.deliveryTime}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _goTonewGeneralRequest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewSpecificRequstDetailsScreen(offer: offer),
          fullscreenDialog: true),
    );
  }
}

class MakeAnOfferDialog extends StatelessWidget {
  const MakeAnOfferDialog({Key key, this.offer, this.onPressed})
      : super(key: key);
  final Offer offer;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralOfferCard(
          offer: offer,
          isDialog: true,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ActionButton(
            label: "Make a Requst",
            onPressed: () {
              onPressed();
              Navigator.pop(context);

              print("object");
            },
            hideShadow: true,
          ),
        )
      ],
    );
  }
}
