import 'package:flutter/material.dart';
import '../../model/offer_model.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

// TODO: FOR ALL COMPONENTS PASS THE OBJECT INSTEAD OF THE CONTENT
class GeneralOffer extends StatelessWidget {
  final Function onPressed;
  String driverName;
  final double rating;
  final String orderName;
  final double price;
  final String time;
  final Offer offer;

  GeneralOffer(
      {@required this.onPressed,
      @required this.driverName,
      @required this.rating,
      @required this.orderName,
      @required this.price,
      @required this.time,
      this.offer});
  @override
  Widget build(BuildContext context) {
    List<Widget> driverRating = [];

    double starsCounter = rating;
    double missingStarsCounter = 5.0 - rating;
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

    int nameSize = (0.025 * displayWidth(context)).toInt();

    if (driverName.length >= nameSize) {
      driverName = driverName.substring(0, nameSize) + "...";
    }

    return RaisedButton(
      onPressed: onPressed,
      color: raisedButtonColor,
      elevation: shadowElevation,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
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
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  driverName,
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
        ),
      ),
    );
  }
}
