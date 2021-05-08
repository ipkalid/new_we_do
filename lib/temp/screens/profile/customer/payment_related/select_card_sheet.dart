import 'package:flutter/material.dart';
import '../../../../components//payment_method_button.dart';
import 'credit_card_list_screen.dart';

class SelectCardSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 6,
              width: 36,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Select a Payment method",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                PaymentMethodButton(
                  text: "Apply Pay",
                  onPressed: () {
                    print("object");
                  },
                ),
                PaymentMethodButton(
                  text: "Credit Card",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditCardListScreen(),
                      ),
                    );
                  },
                ),
                PaymentMethodButton(
                  text: "STC PAY",
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
