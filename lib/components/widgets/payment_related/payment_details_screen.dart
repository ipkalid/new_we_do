import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/model/card_model.dart';
import 'package:we_do/style/color_theme.dart';

class PaymentDetailsScreen extends StatefulWidget {
  PaymentDetailsScreen({Key key, this.creditCard, this.isForPay = false})
      : super(key: key);
  final CreditCard creditCard;
  final bool isForPay;

  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  TextEditingController amountController;
  TextEditingController cardNameController;
  TextEditingController credetCardController;
  TextEditingController expiresDateController;
  TextEditingController cVVController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    cardNameController = TextEditingController(text: widget.creditCard.name);
    credetCardController =
        TextEditingController(text: widget.creditCard.number);
    expiresDateController =
        TextEditingController(text: "${widget.creditCard.expiredDate}");
    cVVController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 86,
              decoration: BoxDecoration(
                boxShadow: [ColorTheme.shadow],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Enter an amount:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  EnterAmmountTextField(amountController: amountController),
                ],
              ),
            ),
            SizedBox(height: 32),
            RegularTextField(
              controller: cardNameController,
              label: "Name",
              withLabel: true,
            ),
            SizedBox(height: 16),
            RegularTextField(
              controller: credetCardController,
              label: "Credet Card Number",
              keyboardType: TextInputType.number,
              withLabel: true,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: RegularTextField(
                    controller: expiresDateController,
                    keyboardType: TextInputType.number,
                    label: "Expires",
                    withLabel: true,
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: RegularTextField(
                    controller: cVVController,
                    keyboardType: TextInputType.number,
                    label: "CVV",
                    withLabel: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ActionButton(
                  label: widget.isForPay ? "Pay" : "Add Money",
                  color: widget.isForPay ? Colors.green : ColorTheme.kOrange,
                  onPressed: () => ""),
            )
          ],
        ),
      ),
    );
  }
}

class EnterAmmountTextField extends StatelessWidget {
  const EnterAmmountTextField({
    Key key,
    @required this.amountController,
  }) : super(key: key);

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
          hintText: "0.00",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 16),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "SAR",
              style: TextStyle(fontSize: 24),
            ),
          )),
      controller: amountController,
    );
  }
}
