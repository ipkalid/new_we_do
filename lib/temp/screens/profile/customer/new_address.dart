import 'package:flutter/material.dart';
import '../../../../style/constant.dart';
import '../../../components/main_button.dart';
import '../../../components/text_field_with_label.dart';
import '../../../components/wedo_appbar.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  String addressName = '', building = '', room = '';
  Color addressNameBorderColor = fieldBorderColor;
  Color buildingBorderColor = fieldBorderColor;
  Color roomBorderColor = fieldBorderColor;

  @override
  Widget build(BuildContext context) {
    WedoAppBar appBar = WedoAppBar();
    return Scaffold(
      appBar: appBar.appbar(
          pageContext: context,
          title: "New Address",
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: ListView(
          children: <Widget>[
            TextFieldWithLabel(
              onChanged: (value) {
                addressName = value;
              },
              borderColor: addressNameBorderColor,
              label: "Name",
              hintText: "Address Name",
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWithLabel(
              onChanged: (value) {
                building = value;
              },
              borderColor: buildingBorderColor,
              label: "Building",
              hintText: "Building Number",
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWithLabel(
              onChanged: (value) {
                room = value;
              },
              borderColor: roomBorderColor,
              label: "Room",
              hintText: "Room Number",
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 40,
            ),
            MainButton(
                onPressed: () {
                  setState(() {
                    if (addressName == '' || building == '' || room == '') {
                      addressName == ''
                          ? addressNameBorderColor = Colors.red
                          : addressNameBorderColor = fieldBorderColor;
                      building == ''
                          ? buildingBorderColor = Colors.red
                          : buildingBorderColor = fieldBorderColor;
                      room == ''
                          ? roomBorderColor = Colors.red
                          : roomBorderColor = fieldBorderColor;
                    } else {
                      //TODO: add the address in the database

                      Navigator.pop(context);

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return SelectAddress();
                      //     }));
                    }
                  });
                },
                text: "Save")
          ],
        ),
      ),
    );
  }
}
