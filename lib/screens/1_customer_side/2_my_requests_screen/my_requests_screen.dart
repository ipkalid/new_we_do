import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_list.dart';
import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';
import 'package:we_do/style/app_color.dart';

class MyRequestsScreen extends StatefulWidget {
  @override
  _MyRequestsScreenState createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
  Future<List<Request>> futureRequestsList;
  Future<List<Service>> futureServicesList;

  void _getRequestsList() {
    futureRequestsList = Request.getMyWaitingRequests();
  }

  void _getServicesList() {
    futureServicesList = Service().getCustomerServices();
  }

  @override
  void initState() {
    super.initState();
    _getRequestsList();
    _getServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Orders"),
          bottom: TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: "Waiting",
              ),
              Tab(
                text: "Confirmed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LiquidPullToRefresh(
              height: 50,
              color: AppColor.kOrange,
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 200,
              onRefresh: () async {
                setState(() {
                  _getRequestsList();
                });
              },
              child: FutureBuilder(
                future: futureRequestsList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RequestList(
                      requestList: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Text("Error"),
                      ],
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            LiquidPullToRefresh(
              height: 50,
              color: AppColor.kOrange,
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 200,
              onRefresh: () async {
                setState(() {
                  _getServicesList();
                });
              },
              child: FutureBuilder(
                future: futureServicesList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RequestList(
                      serviceList: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Text("Error"),
                      ],
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
