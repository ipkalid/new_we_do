import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/transactions_history.dart';
import 'payment_related/select_card_sheet.dart';
import '../../../../style/constant.dart';
import '../../../components/main_button.dart';
import '../../../components/wedo_appbar.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  WedoAppBar appbar = WedoAppBar();
  List<TransactionsHistory> history = [
    TransactionsHistory(
        description: "Remaining cash", date: "12/12/2020", amount: 10.2),
    TransactionsHistory(description: "Promo", date: "11/12/2020", amount: 102),
    TransactionsHistory(
      description: "Pay",
      date: "10/12/2020",
      amount: 10.2,
      status: false,
    ),
  ];

  _showSelectMethodSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (ctx) {
        return SelectCardSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double balance = 202.5;
    return MaterialApp(
      home: Scaffold(
        appBar: appbar.appbar(
            title: "Wallet",
            onPressed: () {
              Navigator.pop(context);
            },
            pageContext: context),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Balance",
                          style: TextStyle(
                              fontSize: 0.042 * displayWidth(context),
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              "$balance",
                              style: TextStyle(
                                  fontSize: 0.077 * displayWidth(context),
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF62479A)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "SAR",
                              style: TextStyle(
                                  fontSize: 0.042 * displayWidth(context),
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: MainButton(
                      onPressed: () {
                        _showSelectMethodSheet();
                      },
                      text: "Add Money",
                      buttonColor: Green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                color: Color(0xFFEFEFEF),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 0.045 * displayWidth(context),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: history,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
