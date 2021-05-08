import 'package:flutter/material.dart';
import '../../../../../style/style.dart';
import '../../../../../style/theme.dart';
import '../../../../components/text_field_with_label.dart';

class AddMoneyByCreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kCustomerTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Money"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  height: 83,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [kBoxShadow],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter an amount: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 46,
                            width: 100,
                            //padding: EdgeInsets.only(top: 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                hintText: "0.0",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text(
                            "SAR",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextFieldWithLabel(
                  label: "Name",
                  hintText: "Name",
                  onChanged: null,
                ),
                SizedBox(height: 16),
                TextFieldWithLabel(
                  label: "Credet Card Number",
                  hintText: "XXXX-XXXX-XXXX-XXXX",
                  inputType: TextInputType.number,
                  onChanged: null,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expires",
                          style: labelStyle(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: TextFieldWithLabel(
                                isCentered: true,
                                hintText: "20XX",
                                inputType: TextInputType.number,
                                onChanged: null,
                                maxLength: 4,
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: 80,
                              child: TextFieldWithLabel(
                                isCentered: true,
                                hintText: "0X",
                                inputType: TextInputType.number,
                                onChanged: null,
                                maxLength: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          child: TextFieldWithLabel(
                            isCentered: true,
                            inputType: TextInputType.number,
                            label: "CVV",
                            hintText: "XXX",
                            onChanged: null,
                            maxLength: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: mainOrange,
                      boxShadow: [kBoxShadow],
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {},
                      child: Text(
                        "Add Money",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
