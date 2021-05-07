import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/customer_model.dart';

import 'driver_model.dart';
import 'network_helper.dart';
import 'request_model.dart';

// revised

//getAllOffers will be called once the user login. and it will be saved an array that will be passed to the general offers screen alongside
//the model object(no need to create another object...?)

// maxPrice field
// method call to getCustomer object.
// loading extra data function.
// learn how to create the queries

// only 20 offers will be shown at first.
// for reloading offers list. (it will call the getAllOffers method again)
// scroll down for more offers. (it

class Offer {
  Driver driver;
  //

  String driverID;
  String offerID;
  String status;
  double deliveryPrice;
  int isSpecific;
  String requestID;
  String deliveryTime;
  String offerType;
  String locationName;
  String category;
  int createdAt;

  // TODO: DELETE THIS.DRIVER after finishing the DUMMY testing
  Offer(
      {this.driverID,
      this.offerID,
      this.status,
      this.deliveryPrice,
      this.isSpecific,
      this.requestID,
      this.deliveryTime,
      this.offerType,
      this.locationName,
      this.category,
      this.driver});

  // it is a constructor that you use when creating an object of the class
  // and its content is coming from a json object
  Offer.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("driverID"))
      driverID = json["driverID"];
    else {
      driver = Driver.fromJson(json["driver"]);
      driverID = driver.driverID;
    }

    offerID = json["offerID"];
    status = json["status"];
    deliveryPrice = json["deliveryPrice"];
    isSpecific = json["isSpecific"];
    requestID = json["requestID"];
    deliveryTime = json["deliveryTime"];
    offerType = json["offerType"];
    locationName = json["locationName"];
    category = json["category"];
    createdAt = json["createdAt"];
  }

  // returns: an array of all the general offers and a driver object embedded
  // in them instead of driverID
  // UC14 - COMPLETE
  static Future<List<Offer>> getAllGeneralOffers(int constant) async {
    // if constant = 0 it means this is the first call
    // if constant >=1 it means the number of loading times.
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/Offers"),
        query: "limit=25&page=$constant&isSpecific=0&status=wating");

    // TODO: there is problem from the backend with this header:
    Map<String, String> header = {"embed": "driver{customer}"};

    var response = await backend.getData(header);

    List<Offer> allOffers = [];
    var anOffer;

    for (anOffer in response) {
      allOffers.add(Offer.fromJson(anOffer));
    }

    return allOffers;
  }

  static Future<Offer> getAnOffer(String offerID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/Offers/$offerID"));

    Map<String, String> header = {};

    var response = await backend.getData(header);

    return Offer.fromJson(response);
  }

  // for a general offer
  static Future<List<Request>> getAllSpecificRequests(String offerID) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/requests"),
        query: "isSpecific=1&offerID=$offerID");

    Map<String, String> header = {"embed": "customer"};

    var response = await backend.getData(header);

    List<Request> allRequests = [];
    var aRequest;

    for (aRequest in response) {
      allRequests.add(Request.fromJson(aRequest));
    }
    return allRequests;
  }

  // UC26 - COMPLETE
  static Future<String> createSpecificOffer(
      String requestID, double deliveryPrice) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(
            path: "/api/customers/$globalDriverId/Offers",
            query: "isSpecific=1"));

    var body = {
      "requestID": requestID,
      "deliveryPrice": deliveryPrice,
    };

    var response = await backend.postData(body);

    return response;
  }

  // UC27 - COMPLETE
  static Future<String> createGeneralOffer(String deliveryTime,
      String offerType, String locationName, double deliveryPrice) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(
            path: "/api/customers/$globalDriverId/Offers",
            query: "isSpecific=1"));

    var body = {
      "deliveryPrice": deliveryPrice,
      "deliveryTime": deliveryTime,
      "offerType": offerType,
      "locationName": locationName,
    };

    var response = await backend.postData(body);

    return response;
  }

  // UC28 - COMPLETE
  static Future<String> cancelOffer(String offerID) async {
    // NetworkHelper backend = NetworkHelper(
    //     url: Uri(path: "/api/customers/$driverID/Offers/$offerID"));

    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/offers/$offerID"));

    var body = {"status": "canceled"};

    var response = await backend.putData(body);

    return response;
  }

// UC28 - COMPLETE
  static Future<String> acceptSpecificOffer(String offerID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/offers/$offerID"));

    var body = {"status": "accepted"};

    var response = await backend.putData(body);

    return response;
  }

  // COMPLETE
  static Future<List<Offer>> getMyWaitingOffers() async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/drivers/$globalDriverId/offers"),
        query: "status=wating");

    var response = await backend.getData({});

    List<Offer> allOffer = [];
    var anOffer;

    for (anOffer in response) {
      allOffer.add(Offer.fromJson(anOffer));
    }

    return allOffer;
  }

  // // accept specific offer
  // // UC29.2 - COMPLETE - Bugged from the backend
  // Future<String> acceptOffer(String offerID) async {
  //   NetworkHelper backend =
  //       NetworkHelper(url: Uri(path: "/api/requests/$offerID"));
  //
  //   // extract this constant into separate file?
  //   var body = {"status": "confirmed"};
  //
  //   var response = await backend.putData(body);
  //
  //   return response;
  // }
}
