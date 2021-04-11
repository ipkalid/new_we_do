import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/buttons/select_button.dart';
import 'package:we_do/components/helper/helper_method.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/components/widgets/address_related/address_card.dart';
import 'package:we_do/model/address_model.dart';
import 'package:we_do/screens/1_customer_side/wedo_customer_app.dart';

class NewRequestLocationScreen extends StatefulWidget {
  NewRequestLocationScreen(
      {@required this.category,
      @required this.place,
      @required this.time,
      @required this.details});
  final String category;
  final String place;
  final String time;
  final String details;

  @override
  _NewRequestLocationScreenState createState() =>
      _NewRequestLocationScreenState();
}

class _NewRequestLocationScreenState extends State<NewRequestLocationScreen> {
  TextEditingController buldingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController couponController = TextEditingController();

  Address _selectedAddress;

  String location = "Select Location";
  bool locationSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Request",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
        children: [
          SelectButton(
            label: location,
            isSelected: locationSelected,
            onPressed: () {
              selectAddress(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "   OR   ",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text("Enter your location", style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          RegularTextField(
            label: "Bulding",
            controller: buldingController,
            withLabel: true,
          ),
          SizedBox(height: 16),
          RegularTextField(
            label: "Room",
            controller: roomController,
            withLabel: true,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              "Add Coupon",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RegularTextField(
                    controller: couponController,
                    label: "coupon",
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: ActionButton(
                    label: "Apply",
                    onPressed: () {
                      if (couponController.text == "") {
                        HelperMethods.showDialogAlert(
                            context: context,
                            title: "Error",
                            message: "Enter a coupon First");
                      }
                    },
                  ),
                )
                // RegularTextField(
                //   label: "coupon",
                //   controller: buldingController,
                // ),
                // SizedBox(width: 16),
                //ActionButton(onPressed: () => print("d"), label: "Apply")
              ],
            ),
          ),
          SizedBox(height: 30),
          ActionButton(
            label: 'Send Request',
            onPressed: () => goToSendRequest(),
          )
        ],
      ),
    );
  }

  void goToSendRequest() async {
    if (buldingController.text == "") {
      HelperMethods.showDialogAlert(
        context: context,
        title: "Error",
        message: "Bulding shoud not be empty",
      );
      return;
    }
    if (roomController.text == "") {
      HelperMethods.showDialogAlert(
          context: context, title: "Error", message: "Room shoud not be empty");
      return;
    }

    Navigator.pop(context);
    Navigator.pop(context);
  }

  void selectAddress(BuildContext context) {
    HelperMethods.showBottomSheet(
      context: context,
      child: Expanded(
        child: ListView(
          children: [
            AddressCard(
              address: adresstst,
              toScreen: false,
              onTap: (value) {
                _selectedAddress = value;
                setState(() {
                  location = _selectedAddress.name;
                  locationSelected = true;
                });

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
