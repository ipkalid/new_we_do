import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class CustomerButton extends StatelessWidget {
  final Function onPressed;
  final String customerName;
  final double rating;
  final String building;
  final String room;

  TextStyle RequestButton(var context) {
    return TextStyle(
      fontSize: 0.0329 * displayWidth(context),
      fontWeight: FontWeight.w700,
    );
  }

  CustomerButton(
      {@required this.onPressed,
      @required this.customerName,
      @required this.rating,
      @required this.building,
      @required this.room});
  @override
  Widget build(BuildContext context) {
    List<Widget> driverRating = [];

    double starsCounter = rating;

    double missingStarsCounter = 5 - rating;

    print(starsCounter);

    while (starsCounter > 0) {
      driverRating.add(Icon(
        Icons.star,
        color: Colors.amber[400],
        size: 0.06 * displayWidth(context),
      ));
      starsCounter--;
    }
    while (missingStarsCounter > 0) {
      driverRating.add(Icon(Icons.star_border,
          color: Colors.amber[400], size: 0.06 * displayWidth(context)));
      missingStarsCounter--;
    }

    return MaterialButton(
      onPressed: onPressed,
      disabledColor: raisedButtonColor,
      disabledElevation: shadowElevation,
      disabledTextColor: Colors.black,
      color: raisedButtonColor,
      elevation: shadowElevation,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: mainYellow,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Icon(
                      Icons.perm_identity,
                      size: 0.11 * displayWidth(context),
                    )),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      customerName,
                      style: driverNameStyle(context),
                    ),
                    Row(
                      children: driverRating,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bulding:$building  Room:$room",
                      style: RequestButton(context),
                    )
                  ],
                )),
            Expanded(
              flex: 3,
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
