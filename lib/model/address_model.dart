import 'package:we_do/helper/hive_preferences.dart';

import 'network_helper.dart';

class Address {
  String customerID;
  String addressID;
  String name;
  String latitude;
  String longitude;
  String buildingNo;
  String room;
  String description;

  Address(
      {this.customerID,
      this.addressID,
      this.name,
      this.latitude,
      this.longitude,
      this.buildingNo,
      this.room,
      this.description});

  Address.fromJson(Map<String, dynamic> json) {
    customerID = json["customerID"];
    addressID = json["addressID"];
    name = json["name"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    buildingNo = json["buildingNo"];
    room = json["room"];
    description = json["description"];
  }

  // UC19 - COMPLETE
  Future<String> createAddress(
      String name, String buildingNo, String description, String room) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$globalUserId/addresses"));

    Map<String, String> body = {
      "name": name,
      "buildingNo": buildingNo,
      "description": description,
      "room": room,
    };

    var response = await backend.postData(body);

    return response;
  }
}

// UC19 - COMPLETE
Future<List<Address>> getCustomerAddresses() async {
  NetworkHelper backend = NetworkHelper(
      url: Uri(path: "/api/addresses"), query: "customerID=$globalUserId");

  var response = await backend.getData({});

  List<Address> allAddresses = [];
  var anAddress;

  for (anAddress in response) {
    allAddresses.add(Address.fromJson(anAddress));
  }
  return allAddresses;
}

//only for testing
var adresstst = Address(
    customerID: "Dd",
    addressID: "ss",
    name: "KFUPM",
    latitude: "12282882",
    longitude: "222222",
    buildingNo: "822",
    room: "022",
    description: "my home");
