import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/payment_related/payment_button.dart';
import 'package:we_do/components/widgets/payment_related/payment_details_screen.dart';
import 'package:we_do/model/card_model.dart';

class PaymentListScreen extends StatelessWidget {
  const PaymentListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Card"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                PaymentButton(
                  label: "AlAhli",
                  onPressed: () =>
                      _goToPaymentDetailsScreen(context, creditCard: carddd),
                  icon: Icons.dashboard_customize,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ActionButton(
                label: "Add New Credit Card",
                onPressed: () =>
                    _goToPaymentDetailsScreen(context, creditCard: carddd),
              )),
        ],
      ),
    );
  }

  void _goToPaymentDetailsScreen(BuildContext context,
      {CreditCard creditCard}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentDetailsScreen(
          creditCard: creditCard,
        ),
      ),
    );
  }
}
