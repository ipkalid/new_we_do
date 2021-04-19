import 'package:flutter/material.dart';
import 'package:we_do/model/transaction_model.dart';

class TransactionsHistoryCard extends StatelessWidget {
  TransactionsHistoryCard({@required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.credit_card_sharp,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 6),
                Text(
                  transaction.date,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "+ ${transaction.amount} SAR",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.green,
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
