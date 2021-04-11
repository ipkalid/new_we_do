import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/buttons/select_button.dart';
import 'package:we_do/components/helper/helper_method.dart';
import 'package:we_do/components/text_field/long_text_field.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/screens/1_customer_side/3_new_request/new_request_location_screen.dart';

class NewRequstDetailsScreen extends StatefulWidget {
  const NewRequstDetailsScreen({Key key}) : super(key: key);

  @override
  _NewRequstDetailsScreenState createState() => _NewRequstDetailsScreenState();
}

class _NewRequstDetailsScreenState extends State<NewRequstDetailsScreen> {
  TextEditingController placeController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  String category = "Select Catagory";
  bool categorySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 32,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          "New Request",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SelectButton(
            label: category,
            isSelected: categorySelected,
            onPressed: () {
              _selectCategory();
            },
          ),
          SizedBox(height: 30),
          RegularTextField(
            controller: placeController,
            label: "Place",
            withLabel: true,
          ),
          SizedBox(height: 16),
          RegularTextField(
            controller: timeController,
            label: "Time",
            withLabel: true,
          ),
          SizedBox(height: 16),
          LongTextField(
            label: "Details",
            controller: detailsController,
            withLabel: true,
          ),
          SizedBox(height: 30),
          ActionButton(
            label: "Next",
            onPressed: () => goToNewRequestLocationScreen(),
          )
        ],
      ),
    );
  }

  void goToNewRequestLocationScreen() async {
    if (placeController.text == "") {
      HelperMethods.showDialogAlert(
          context: context,
          title: "Error",
          message: "Place shoud not be empty");
      return;
    }
    if (timeController.text == "") {
      HelperMethods.showDialogAlert(
          context: context, title: "Error", message: "Time shoud not be empty");
      return;
    }
    if (detailsController.text == "") {
      HelperMethods.showDialogAlert(
          context: context,
          title: "Error",
          message: "Details shoud not be empty");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewRequestLocationScreen(
            category: category,
            details: detailsController.text,
            place: placeController.text,
            time: timeController.text),
      ),
    );
  }

  void _selectCategory() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        message: const Text('Select Category'),
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            setState(() {
              category = "Select Catagory";
              categorySelected = false;
              Navigator.pop(context);
            });
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Fast Food'),
            onPressed: () {
              setState(() {
                category = "Fast Food";
                categorySelected = true;
                Navigator.pop(context);
              });
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Coffee'),
            onPressed: () {
              setState(() {
                category = "Coffee";
                categorySelected = true;
                Navigator.pop(context);
              });
            },
          )
        ],
      ),
    );
  }
}
