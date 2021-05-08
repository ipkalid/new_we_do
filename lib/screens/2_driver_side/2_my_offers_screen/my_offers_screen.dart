import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_list.dart';
import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';
import 'package:we_do/style/app_color.dart';

class MyOffersScreen extends StatefulWidget {
  @override
  _MyOffersScreenState createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  Future<List<Offer>> futureOffersList;
  Future<List<Service>> futureServicesList;

  //getmyWaitingOffers
  //getMy

  void _getWaitingOffersList() {
    futureOffersList = Offer.getMyWaitingOffers();
  }

  void _getServicesList() {
    futureServicesList = Service().getDriverServices(globalDriverId);
  }

  @override
  void initState() {
    super.initState();
    _getWaitingOffersList();
    _getServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        setState(() {
          _getWaitingOffersList();
          _getServicesList();
        });
      },
      child: DefaultTabController(
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
                    _getWaitingOffersList();
                  });
                },
                child: FutureBuilder(
                  future: futureOffersList,
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
      ),
    );
  }
}
