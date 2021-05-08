import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_list.dart';
import 'package:we_do/components/widgets/service_related/request_related/general_request/general_request_lst.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/filter_screen.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/offer_search.dart';
import 'package:we_do/style/app_color.dart';

class RequestsScreen extends StatefulWidget {
  RequestsScreen({Key key}) : super(key: key);

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  var _filterdData;
  Future<List<Request>> futureRequestList;
  void _getRequests() {
    futureRequestList = Request.getAllGeneralRequests(0);
  }

  @override
  void initState() {
    super.initState();
    _getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => _goToSearch(),
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            tooltip: 'Filter',
            onPressed: () => _goToFilterScreen(),
          ),
        ],
      ),
      body: FocusDetector(
        onFocusGained: () {
          setState(() {
            _getRequests();
          });
        },
        child: LiquidPullToRefresh(
          height: 50,
          color: AppColor.kOrange,
          showChildOpacityTransition: false,
          springAnimationDurationInMilliseconds: 200,
          onRefresh: () async {
            setState(() {
              _getRequests();
            });
          },
          child: FutureBuilder(
            future: futureRequestList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GeneralRequestList(
                  requestsList: snapshot.data,
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
      ),
    );
  }

  _goToFilterScreen() async {
    final filterData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(),
        fullscreenDialog: true,
      ),
    );
    _filterdData = filterData;
    print(_filterdData);
  }

  _goToSearch() async {
    showSearch(
        context: context, delegate: OfferSearch(filterdData: _filterdData));
  }
}
