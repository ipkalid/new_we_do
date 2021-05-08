import 'package:flutter/material.dart';
import '../../../model/request_model.dart';
import '../../../temp/components/s_request_details.dart';
import '../../../temp/components/detail.dart';
import '../../../temp/components/main_button.dart';
import '../../../style/constant.dart';
import '../../../temp/components/wedo_appbar.dart';

class SRequestConfirmed extends StatefulWidget {
  Request theRequest;

  SRequestConfirmed(this.theRequest);

  @override
  _SRequestConfirmedState createState() =>
      _SRequestConfirmedState(theRequest: theRequest);
}

class _SRequestConfirmedState extends State<SRequestConfirmed> {
  Request theRequest;

  _SRequestConfirmedState({this.theRequest});

  Widget _buildPopupDialog(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Status",
                      style: TextStyle(
                          fontSize: 0.05 * displayWidth(context),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MainButton(
                      onPressed: () {
                        //TODO: Change the status here
                        Navigator.pop(context);
                        setState(() {
                          theRequest.status = "On The Way";
                        });

                      },
                      text: "On The Way",
                      buttonColor: Color(0xFF7AA4E3),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {
                        //TODO: Change the status here
                        Navigator.pop(context);
                        setState(() {
                          theRequest.status = "Delivered";
                        });
                      },
                      text: "Delivered",
                      buttonColor: Color(0xFFEFEFEF),
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainButton(
                      onPressed: () {
                        //TODO: Change the status here
                        Navigator.pop(context);
                        setState(() {
                          theRequest.status = "Canceled";
                        });
                      },
                      text: "Canceled",
                      buttonColor: Red,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    String theRequestStatus = theRequest.status;
    WedoAppBar appbar = WedoAppBar();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Request",
            style: TextStyle(
                color: Colors.black,
                fontSize: 0.055 * displayWidth(context),
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(0xFF7AA4E3),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          SRequestDetails(
                            customerName: theRequest.address.customer.name,
                            rating: theRequest.address.customer.rating,
                            // TODO: FIX THE BUILDING NUMBER AND ROOM NUMBER
                            building: "845",
                            room: "211",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Status: $theRequestStatus",
                            style: TextStyle(
                                fontSize: 0.045 * displayWidth(context),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                ),
                Detail(
                  detail: "my order: \n1- xxxxxx\n2- xxxxxxx\n 3- xxxxxx",
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  child: Column(
                    children: [
                      MainButton(
                        onPressed: () {},
                        text: "Assign bill",
                        buttonColor: Green,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MainButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context),
                          );
                        },
                        text: "Change status",
                        buttonColor: Green,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MainButton(
                        onPressed: () {},
                        text: "Chat",
                        buttonColor: Green,
                      ),
                      //MainButton(onPressed: (){}, text: "Cancel", buttonColor: Red,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
