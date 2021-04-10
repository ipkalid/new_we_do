import 'package:flutter/material.dart';

class OfferSearch extends SearchDelegate {
  OfferSearch({this.filterdData});
  //Future<List<ComponyPlace>> futurenerbyPlacesList;
  var filterdData;

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
