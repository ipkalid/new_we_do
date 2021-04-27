import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/offer_related/general_offer_card.dart';
import 'package:we_do/model/offer_model.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/filter_screen.dart';
import 'package:we_do/screens/1_customer_side/1_offer_screens/offer_search.dart';


class OfferScreen extends StatefulWidget {
  OfferScreen({Key key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var _filterdData;
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          GeneralOfferCard(
            offer: generaloffer,
          )
        ],
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
