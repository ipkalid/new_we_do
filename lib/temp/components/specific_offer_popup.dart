import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'text_field_with_label.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class SpecificOfferPopup extends StatelessWidget {
  final Function onPressed;
  String customerName;
  final int rating;
  final String orderName;
  final int building;
  final int room;
  final Function onChanged;

  SpecificOfferPopup(
      {@required this.onPressed,
      @required this.customerName,
      @required this.rating,
      @required this.orderName,
      @required this.building,
      @required this.room,
      @required this.onChanged});
  @override
  Widget build(BuildContext context) {
    List<Widget> customerRating = [];

    int starsCounter = rating;
    int missingStarsCounter = 5 - rating;
    while (starsCounter > 0) {
      customerRating.add(Icon(
        Icons.star,
        color: Colors.amber[400],
        size: 0.04 * displayWidth(context),
      ));
      starsCounter--;
    }
    while (missingStarsCounter > 0) {
      customerRating.add(Icon(Icons.star_border,
          color: Colors.amber[400], size: 0.04 * displayWidth(context)));
      missingStarsCounter--;
    }

    int nameSize = (0.025 * displayWidth(context)).toInt();

    if (customerName.length >= nameSize) {
      customerName = customerName.substring(0, nameSize) + "...";
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: mainYellow,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.perm_identity,
                              size: 0.095 * displayWidth(context),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                customerName,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: driverNameOfferStyle(context),
                              ),
                              Row(
                                children: customerRating,
                              )
                            ])
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: mainYellow,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 0.095 * displayWidth(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      orderName,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: orderNameOfferStyle(context),
                    ))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Building",
                    style: headersStyle(context),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    building.toString(),
                    style: dataStyle(context),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Room",
                    style: headersStyle(context),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    room.toString(),
                    style: dataStyle(context),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFieldWithLabel(
              onChanged: onChanged,
              label: "Price",
              inputType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
