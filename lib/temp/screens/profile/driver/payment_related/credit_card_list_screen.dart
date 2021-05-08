import 'package:flutter/material.dart';
import '../../../../../style/theme.dart';
import '../../../../components/payment_method_button.dart';

import 'add_new_credit.dart';

class CreditCardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kCustomerTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Credit Card"),
        ),
        body: ListView(
          children: [
            PaymentMethodButton(
              text: "Al Ahli",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMoneyByCreditCard(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
