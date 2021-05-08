import 'package:flutter/material.dart';
import '../../style.dart';
import '../../constant.dart';

class AddressButton extends StatelessWidget {
  final String addressName;
  final int buildingNumber;
  final int room;
  final Function onPressed;

  AddressButton(
      {@required this.onPressed,
      @required this.addressName,
      @required this.buildingNumber,
      @required this.room});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: raisedButtonColor,
      elevation: shadowElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    addressName,
                    style: addressNameStyle(context),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Building: " + buildingNumber.toString(),
                        style: buildingNumberStyle(context),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Room: " + room.toString(),
                        style: roomStyle(context),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 0.14 * displayWidth(context),
                )),
          ],
        ),
      ),
    );
  }
}
