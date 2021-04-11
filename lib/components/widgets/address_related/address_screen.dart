import 'package:flutter/material.dart';
import 'package:we_do/components/buttons/action_button.dart';
import 'package:we_do/components/text_field/regular%20text_field.dart';
import 'package:we_do/model/address_model.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({this.address});
  final Address address;

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController buldingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (Address != null) {
      nameController.text = widget.address.name;
      buldingController.text = widget.address.buildingNo;
      roomController.text = widget.address.room;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RegularTextField(
              label: "Name",
              withLabel: true,
              controller: nameController,
            ),
            RegularTextField(
              label: "Bulding",
              withLabel: true,
              controller: buldingController,
            ),
            RegularTextField(
              label: "Room",
              withLabel: true,
              controller: roomController,
            ),
            SizedBox(height: 64),
            ActionButton(
                label: "Save",
                onPressed: () {
                  widget.address.name = nameController.text;
                }),
            SizedBox(height: 16),
            ActionButton(
              label: "Delete",
              //TODO: API
              onPressed: () => "",
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
