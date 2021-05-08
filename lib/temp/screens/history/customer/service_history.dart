import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/temp/components/action_button.dart';
import 'package:we_do/model/service_model.dart';
import 'package:we_do/temp/components/detail.dart';
import 'package:we_do/temp/components/driver_button.dart';
import 'package:we_do/temp/components/wedo_appbar.dart';
import 'package:we_do/temp/screens/history/customer/report_details.dart';
import '../../../../style/constant.dart';

class CServiceHistory extends StatefulWidget {
  Service theService;
  // TODO: WRITE THE CONSTRUCTOR

  CServiceHistory({this.theService});

  @override
  _CServiceHistoryState createState() =>
      _CServiceHistoryState(theService: theService);
}

class _CServiceHistoryState extends State<CServiceHistory> {
  Service theService;

  _CServiceHistoryState({this.theService});

  int dropDownValue = 0;

  @override
  Widget build(BuildContext context) {
    //create a new object to get access to the components
    WedoAppBar components = WedoAppBar();

    return Scaffold(
      //appbar component
      appBar: components.appbar(
          title: "Order",
          pageContext: context,
          onPressed: () {
            Navigator.pop(context);
          }),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CReportDetails(
                              theService: theService,
                            )),
                  );
                },
                orderName: theService.request.deliverFrom,
                date: "",
                orderTime: theService.request.deliveryTime,
                buttonText: "Report",
                buttonColor: Green,
              ),
            ),
            Detail(detail: theService.request.description),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Driver",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DriverButton(
                onPressed: () {},
                driverName: theService.offer.driver.customer.name,
                rating: theService.offer.driver.customer.rating,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Payment Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cost:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        theService.orderCost.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Delivery",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        theService.offer.deliveryPrice.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Payment:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        (theService.orderCost + theService.offer.deliveryPrice)
                            .toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                  child: Text("Rate",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                DropdownButton<int>(
                  value: dropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 25,
                  elevation: 16,
                  style: TextStyle(color: Colors.lightGreen),
                  underline: Container(
                    height: 3,
                    color: Colors.lightGreen,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      print(newValue);
                      dropDownValue = newValue;

                      // TODO: update the database with the new value
                    });
                  },
                  items: <int>[
                    0,
                    1,
                    2,
                    3,
                    4,
                    5,
                  ].map<DropdownMenuItem<int>>((int val) {
                    // ignore: missing_required_param
                    return DropdownMenuItem<int>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
