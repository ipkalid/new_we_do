import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../style/constant.dart';

class TransactionsHistory extends StatelessWidget {
  final bool status;
  final String description;
  final String date;
  final double amount;

  String amountText;
  Container addOrDrawIcon = Container(
    decoration: BoxDecoration(
      color: Green,
      shape: BoxShape.circle,
    ),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Icon(
        Icons.credit_card_sharp,
        size: 30,
      ),
    ),
  );
  Color amountColor = Green;

  TransactionsHistory(
      {this.status: true,
      @required this.description,
      @required this.date,
      @required this.amount}) {
    if (status != true) {
      addOrDrawIcon = Container(
        decoration: BoxDecoration(
          color: Red,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.credit_card_sharp,
            size: 30,
          ),
        ),
      );
      amountColor = Red;
      amountText = "- $amount SAR";
    } else {
      amountText = "+ $amount SAR";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addOrDrawIcon,
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 0.039 * displayWidth(context),
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 0.039 * displayWidth(context),
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amountText,
                    style: TextStyle(
                      fontSize: 0.045 * displayWidth(context),
                      fontWeight: FontWeight.w300,
                      color: amountColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
