import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/buttons/select_button.dart';
import 'package:we_do/components/helper/helper_method.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';

class NewRequestLocationScreen extends StatefulWidget {
  NewRequestLocationScreen(
      {this.category, this.place, this.time, this.details});
  final String category;
  final String place;
  final String time;
  final String details;

  @override
  _NewRequestLocationScreenState createState() =>
      _NewRequestLocationScreenState();
}

class _NewRequestLocationScreenState extends State<NewRequestLocationScreen> {
  TextEditingController locationNameController = TextEditingController();
  TextEditingController buldingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

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
              // _selectCategory();
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
          Text("New Location", style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          RegularTextField(
            label: "Name",
            controller: locationNameController,
            withLabel: true,
          ),
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
          Text(
            "Add coupon",
            //  style: labelStyle(context),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: RegularTextField(
          //         label: "Bulding",
          //         controller: buldingController,
          //       ),
          //     ),
          //     SizedBox(width: 16),
          //     ActionButton(onPressed: () => print("d"), label: "Apply")
          //   ],
          // ),
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
    if (detailsController.text == "") {
      HelperMethods.showDialogAlert(
          context: context, title: "Error", message: "Enter a Place First");
      return;
    }

    Navigator.pop(context);
  }
}
