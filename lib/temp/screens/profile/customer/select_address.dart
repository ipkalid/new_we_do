import 'package:flutter/material.dart';
import '../../../components/address_button.dart';
import '../../../components/main_button.dart';
import '../../../components/wedo_appbar.dart';

import 'new_address.dart';

class SelectAddress extends StatelessWidget {
  List<Padding> getAddresses() {
    //TODO: get the customer addresses
    List<Padding> addresses = [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: AddressButton(
            onPressed: () {},
            addressName: "Home",
            buildingNumber: 845,
            room: 311),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: AddressButton(
            onPressed: () {},
            addressName: "My friend",
            buildingNumber: 850,
            room: 224),
      )
    ];
    return addresses;
  }

  @override
  Widget build(BuildContext context) {
    WedoAppBar appBar = WedoAppBar();
    return Scaffold(
      appBar: appBar.appbar(
          pageContext: context,
          title: "Addresses",
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Column(
          children: <Widget>[
            MainButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewAddress();
                  }));
                },
                text: "Add a new address"),
            SizedBox(
              height: 20,
            ),
            Column(
              children: getAddresses(),
            )
          ],
        ),
      ),
    );
  }
}
