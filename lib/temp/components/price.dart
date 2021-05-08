import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class Price extends StatelessWidget {

  final double price;

  Price({@required this.price});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      disabledColor: raisedButtonColor,
      disabledElevation: shadowElevation,
      disabledTextColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Total Price:",
              style: totalPriceHeaderStyle(context),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(price.toString(),
                  style: priceStyle(context),
                ),
                Text("SAR",
                  style:SARStyle(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
