import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/buttons/select_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/style/app_color.dart';

class NewOfferScreen extends StatefulWidget {
  const NewOfferScreen({Key key}) : super(key: key);

  @override
  _NewOfferScreenState createState() => _NewOfferScreenState();
}

class _NewOfferScreenState extends State<NewOfferScreen> {
  String maxPrice;
  String deilveryTime;
  TextEditingController placeController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController deliveryPriceController = TextEditingController();

  TextEditingController deilveryTimeController = TextEditingController();

  TextEditingController detailsController = TextEditingController();

  String category = "Select Catagory";
  bool categorySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBlue,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 32,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          "New Offer",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
        children: [
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
            controller: deliveryPriceController,
            label: "Delivery Price",
            withLabel: true,
          ),
          SizedBox(height: 16),
          RegularTextField(
            controller: deilveryTimeController,
            label: "Delivery Time",
            withLabel: true,
          ),
          SizedBox(height: 30),
          ActionButton(
            label: 'Send Your Offer',
            onPressed: () {
              Offer.createGeneralOffer2(
                deliveryPrice: double.parse(deliveryPriceController.text),
                deliveryTime: deilveryTimeController.text,
                offerType: category,
                locationName: placeController.text,
              ).then((value) => Navigator.pop(context));
            },
          )
        ],
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
