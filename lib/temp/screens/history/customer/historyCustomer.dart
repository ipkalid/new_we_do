import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/model/customer_model.dart';
import 'package:we_do/model/driver_model.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';
import 'package:we_do/temp/components/historyOrder.dart';
import 'package:we_do/temp/components/wedo_appbar.dart';
import 'package:we_do/temp/screens/history/customer/service_history.dart';

// TODO: revert back what you did with the history button later

class CustomerHistory extends StatefulWidget {
  @override
  _CustomerHistoryState createState() => _CustomerHistoryState();
}

class _CustomerHistoryState extends State<CustomerHistory> {
  List<Service> listOfServices = [
    Service(
        offer: Offer(
            locationName: "Mcdonalds",
            driver: Driver(
                rating: 3.6, customer: Customer(name: "Mansour", rating: 4.6)),
            deliveryTime: "12:00",
            deliveryPrice: 23),
        request: Request(
            description: "dfs",
            deliverFrom: "Mcdonalds",
            deliveryTime: "12:00"),
        orderCost: 21),
    Service(
        offer: Offer(
            locationName: "Herfy",
            driver: Driver(
                rating: 3.6, customer: Customer(name: "Mansour", rating: 4.6)),
            deliveryTime: "12:00",
            deliveryPrice: 23),
        request: Request(
            description: "dfs", deliverFrom: "Herfy", deliveryTime: "12:00"),
        orderCost: 25),
  ];

  getFinishedServices() async {
    //listOfServices = await Service.getCustomerClosedServices();
  }

  @override
  void initState() {
    super.initState();

    getFinishedServices();
  }

  List<Padding> getServicesList(context) {
    List<Padding> servicesListWidgets = [];

    for (int i = 0; i < listOfServices.length; i++) {
      servicesListWidgets.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: HistoryButton(
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CServiceHistory(theService: listOfServices[i])))
              // GReqWaitingDetails(requestsList[i])
            },
            orderName: listOfServices[i].request.deliverFrom,
            orderTime: listOfServices[i].request.deliveryTime,
            orderDate: '',
          ),
        ),
      );
    }

    return servicesListWidgets;
  }

  @override
  Widget build(BuildContext context) {
    //create a new object to get access to the components
    WedoAppBar appBar = WedoAppBar();

    return Scaffold(
      //appbar component
      appBar: appBar.centerAppBar(title: "History", pageContext: context),

      body: Column(children: [
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: getServicesList(context)),
        ),
      ]),
    );
  }
}
