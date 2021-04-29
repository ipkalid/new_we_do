import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/buttons/select_button.dart';
import 'package:we_do/components/helper/helper_method.dart';
import 'package:we_do/components/text_field/long_text_field.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/components/widgets/address_related/address_card.dart';
import 'package:we_do/model/address_model.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';

class NewSpecificRequstDetailsScreen extends StatefulWidget {
  NewSpecificRequstDetailsScreen({this.offer});
  final Offer offer;

  @override
  _NewSpecificRequstDetailsScreenState createState() =>
      _NewSpecificRequstDetailsScreenState();
}

class _NewSpecificRequstDetailsScreenState
    extends State<NewSpecificRequstDetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController buldingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController couponController = TextEditingController();

  String category = "Select Catagory";

  List<Address> customerAddress;

  void getAddreses() async {
    customerAddress = await Address.getCustomerAddresses();
  }

  Address selectedAddress;

  String location = "Select Location";
  bool locationSelected = false;

  @override
  void initState() {
    super.initState();
    getAddreses();
  }

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
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 32),
        children: [
          LongTextField(
            label: "Details",
            controller: detailsController,
            withLabel: true,
          ),
          SizedBox(height: 16),
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
            label: "Name",
            controller: nameController,
            withLabel: true,
          ),
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
              ],
            ),
          ),
          SizedBox(height: 30),
          ActionButton(
            label: 'Send Request',
            onPressed: () => _sendRequest(),
          )
        ],
      ),
    );
  }

  void _sendRequest() async {
    if (detailsController.text == "") {
      HelperMethods.showDialogAlert(
          context: context,
          title: "Error",
          message: "Details shoud not be empty");
      return;
    }
    if (selectedAddress == null) {
      if (buldingController.text == "") {
        HelperMethods.showDialogAlert(
          context: context,
          title: "Error",
          message: "Address Name shoud not be empty",
        );
        return;
      }

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
            context: context,
            title: "Error",
            message: "Room shoud not be empty");
        return;
      }
      Address.createAddress(
        name: nameController.text,
        buildingNo: buldingController.text,
        description: "",
        room: roomController.text,
      ).then(
        (address) => Request.createSpecificRequest(
          offerID: widget.offer.offerID,
          description: detailsController.text,
          addressID: address,
        ),
      );
    } else {
      Request.createSpecificRequest(
        offerID: widget.offer.offerID,
        description: detailsController.text,
        addressID: selectedAddress.addressID,
      );
    }

    Navigator.pop(context);
  }

  void selectAddress(BuildContext context) {
    if (customerAddress.isEmpty) return;

    List<Widget> addresesCards = [];

    for (var address in customerAddress) {
      addresesCards.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AddressCard(
            address: address,
            toScreen: false,
            onTap: (value) {
              selectedAddress = value;
              setState(() {
                location = selectedAddress.name;
                locationSelected = true;
              });

              Navigator.pop(context);
            },
          ),
        ),
      );
    }
    HelperMethods.showBottomSheet(
      context: context,
      child: Expanded(
        child: ListView(
          children: addresesCards,
        ),
      ),
    );
  }
}
