import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class SpecificRequestDetails extends StatelessWidget {
  final Function onPressed;
  String customerName;
  final double rating;
  final String orderName;
  final double price;
  final String time;

  String available = "Available Until ";

  SpecificRequestDetails(
      {@required this.onPressed,
      @required this.customerName,
      @required this.rating,
      @required this.orderName,
      @required this.price,
      @required this.time});
  @override
  Widget build(BuildContext context) {
    List<Widget> driverRating = [];

    double starsCounter = rating;
    double missingStarsCounter = 5 - rating;
    while (starsCounter > 0) {
      driverRating.add(Icon(
        Icons.star,
        color: Colors.amber[400],
        size: 0.04 * displayWidth(context),
      ));
      starsCounter--;
    }
    while (missingStarsCounter > 0) {
      driverRating.add(Icon(Icons.star_border,
          color: Colors.amber[400], size: 0.04 * displayWidth(context)));
      missingStarsCounter--;
    }

    int nameSize = (0.03 * displayWidth(context)).toInt();
    if (customerName.length >= nameSize) {
      customerName = customerName.substring(0, nameSize) + "...";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: mainYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.perm_identity,
                        size: 0.095 * displayWidth(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: <Widget>[
                    Text(
                      customerName,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: driverNameOfferStyle(context),
                    ),
                    Row(
                      children: driverRating,
                    )
                  ])
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: mainYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 0.095 * displayWidth(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    orderName,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: orderNameOfferStyle(context),
                  ))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Price",
                  style: headersStyle(context),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price.toString() + " SAR",
                  style: dataStyle(context),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Time",
                  style: headersStyle(context),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: dataStyle(context),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
