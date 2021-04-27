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

  // UC16 - COMPLETE
  static Future<String> createSpecificRequest(String offerID, String customerID,
      String description, String addressID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$customerID/requests"));

    var body = {
      "offerID": offerID,
      "description": description,
      "addressID": addressID,
    };

    var response = await backend.postData(body);

    return response;
  }

  // UC17 - COMPLETE
  static Future<String> createGeneralRequest(
      String customerID,
      String deliveryTime,
      String deliverFrom,
      String description,
      String addressID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$customerID/requests"));

    var body = {
      "deliveryTime": deliveryTime,
      "deliverFrom": deliverFrom,
      "description": description,
      "addressID": addressID,
    };

    var response = await backend.postData(body);

    return response;
  }

  static Future<List<Request>> getMyWaitingRequests(String customerID) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/customers/$customerID/requests"),
        query: "status=wating");

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
}
