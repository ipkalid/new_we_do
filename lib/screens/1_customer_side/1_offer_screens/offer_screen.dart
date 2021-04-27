import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_card.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_related/general_offer_list.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/filter_screen.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/offer_search.dart';
import 'package:we_do/style/app_color.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var _filterdData;
  Future<List<Offer>> futureOfferList;
  void _getOffer() {
    futureOfferList = Offer.getAllGeneralOffers(0);
  }

  @override
  void initState() {
    super.initState();
    _getOffer();
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
      body: LiquidPullToRefresh(
        height: 50,
        color: AppColor.kOrange,
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 200,
        onRefresh: () async {
          setState(() {
            _getOffer();
          });
        },
        child: FutureBuilder(
          future: futureOfferList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GeneralOfferList(
                offerList: snapshot.data,
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
