import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/widgets/payment_related/payment_list.dart';
import 'package:we_do/model/transaction_model.dart';
import 'package:we_do/screens/1_customer_side/5_profile_screen/widgets/transactions_history.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          "12.12",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF62479A)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "SAR",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 48,
                  width: 135,
                  child: ActionButton(
                    label: "Add Money",
                    color: Colors.green,
                    hideShadow: true,
                    onPressed: () => _goToPaymentListScreen(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xffEFEFEF),
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TransactionsHistoryCard(transaction: transss),
                  TransactionsHistoryCard(transaction: transss),
                  TransactionsHistoryCard(transaction: transss)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _goToPaymentListScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentListScreen(),
      ),
    );
  }
}
