import 'package:flutter/cupertino.dart';
import 'package:we_do/helper/hive_preferences.dart';

import 'address_model.dart';
import 'customer_model.dart';
import 'network_helper.dart';
import 'offer_model.dart';

class Request {
  Customer customer;
  Address address;

  //
  String customerID;
  String requestID;
  String addressID;
  String deliveryTime;
  String deliverFrom;
  String description;
  String status;
  int isSpecific;
  String offerID;

  // TODO: DELETE THIS.CUSTOMER after finishing the DUMMY testing

  Request(
      {this.customerID,
      this.requestID,
      this.addressID,
      this.deliveryTime,
      this.deliverFrom,
      this.description,
      this.status,
      this.isSpecific,
      this.offerID,
      this.customer});

  Request.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("customerID"))
      customerID = json["customerID"];
    else {
      customer = Customer.fromJson(json["customer"]);
      customerID = customer.customerID;
    }

    if (json.containsKey("addressID"))
      addressID = json["addressID"];
    else {
      address = Address.fromJson(json["address"]);
      addressID = address.addressID;
    }

    requestID = json["requestID"];
    deliveryTime = json["deliveryTime"];
    deliverFrom = json["deliverFrom"];
    description = json["description"];
    status = json["status"];
    isSpecific = json["isSpecific"];
    offerID = json["offerID"];
  }

  // for a general request
  static Future<List<Offer>> getAllSpecificOffers(String requestID) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/Offers"),
        query: "isSpecific=1&requestID=$requestID");

    Map<String, String> header = {"embed": "driver{customer}"};

    var response = await backend.getData(header);

    List<Offer> allOffers = [];
    var anOffer;

    for (anOffer in response) {
      allOffers.add(Offer.fromJson(anOffer));
    }
    return allOffers;
  }

  static Future<List<Request>> getAllGeneralRequests(int constant) async {
    // if constant = 0 it means this is the first call
    // if constant >=1 it means the number of loading times.
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/requests"),
        query: "limit=25&page=$constant&isSpecific=0&status=wating");
    // TODO: there is problem from the backend with this header:
    Map<String, String> header = {"embed": "customer, address"};
    var response = await backend.getData(header);
    List<Request> allRequests = [];
    var aRequest;
    for (aRequest in response) {
      allRequests.add(Request.fromJson(aRequest));
    }
    return allRequests;
  }

  // UC16 - COMPLETE
  static Future<String> createSpecificRequest(
      {@required String offerID,
      @required String description,
      @required String addressID,
      @required String deliveryTime,
      @required String deliverFrom}) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$globalUserId/requests"));

    var body = {
      "offerID": offerID,
      "description": description,
      "addressID": addressID,
      "deliveryTime": deliveryTime,
      "deliverFrom": deliverFrom,
    };

    var response = await backend.postData(body);

    return response;
  }

  // UC17 - COMPLETE
  static Future<String> createGeneralRequest({
    @required String deliveryTime,
    @required String deliverFrom,
    @required String description,
    @required String addressID,
  }) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$globalUserId/requests"));

    var body = {
      "deliveryTime": deliveryTime,
      "deliverFrom": deliverFrom,
      "description": description,
      "addressID": addressID,
    };

    var response = await backend.postData(body);

    return response;
  }

  static Future<List<Request>> getMyWaitingRequests() async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/customers/$globalUserId/requests"),
        query: "status=wating");
    print(globalUserId);
//TODO: FIX it line  116 wating
    var response = await backend.getData({});

    List<Request> allRequests = [];
    var aRequest;

    for (aRequest in response) {
      allRequests.add(Request.fromJson(aRequest));
    }

    return allRequests;
  }

  static Future<String> cancelRequest(String requestID) async {
    // NetworkHelper backend = NetworkHelper(
    //     url: Uri(path: "/api/customers/$customerID/Requests/$requestID"));
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/Requests/$requestID"));

    var body = {"status": "canceled"};

    var response = await backend.putData(body);

    return response;
  }

  // accept specific request
  // UC29.1 - COMPLETE - Bugged from the backend
  Future<String> acceptRequest(String requestID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/requests/$requestID"));

    // TODO: extract this constant into separate file?
    var body = {"status": "confirmed"};

    var response = await backend.putData(body);

    return response;
  }
}
