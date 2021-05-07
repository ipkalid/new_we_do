import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/request_model.dart';

import 'network_helper.dart';
import 'offer_model.dart';

class Service {
  Request request;
  Offer offer;

  String customerID;
  String driverID;
  String serviceID;
  int startedAt;
  String endedAt;
  String status;
  int orderCost;
  String requestID;
  String offerID;
  String chatID;
  String complaintID;

  // TODO: DELETE this.offer and this.request after finishing the DUMMY testing
  Service(
      {this.offer,
      this.request,
      this.customerID,
      this.driverID,
      this.serviceID,
      this.startedAt,
      this.endedAt,
      this.status,
      this.orderCost,
      this.requestID,
      this.offerID,
      this.chatID,
      this.complaintID});

  Service.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("requestID"))
      requestID = json["requestID"];
    else {
      request = Request.fromJson(json["request"]);
      requestID = request.requestID;
    }

    if (json.containsKey("offerID"))
      offerID = json["offerID"];
    else {
      offer = Offer.fromJson(json["offer"]);
      offerID = offer.offerID;
    }

    customerID = json["customerID"];
    driverID = json["driverID"];
    serviceID = json["serviceID"];
    startedAt = json["startedAt"];
    endedAt = json["endedAt"];
    status = json["status"];
    orderCost = json["orderCost"];
    chatID = json["chatID"];
    complaintID = json["complaintID"];
  }

  // UC30 - COMPLETE
  /*
  statuses we have for services: {new, To The Store, At The Store, To The Camp, On The Way, Delivered, canceled, done}
      these statuses will be used only to track the order and no special effect to them. 

  For requests/offers: {wating, confirmed, payment, canceled, done, doneReported, doneRated, doneBoth}
      these status will be used heavily in moving between the screens.
    
   */
  Future<String> changeStatus(String serviceID, String newStatus) async {
    // the real path should be "/api/customers/$globalUserID/services/$serviceID"
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/services/$serviceID"));

    // TODO: newStatus must be a constant...enumeration
    var body = {"status": newStatus};

    var response = await backend.putData(body);

    return response;
  }

  Future<List<Service>> getCustomerServices() async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$globalUserId/services"));

    Map<String, String> header = {
      "embed": "request{address{customer}}, offer{driver{customer}}"
    };

    var response = await backend.getData(header);

    List<Service> allServices = [];
    var aService;

    for (aService in response) {
      allServices.add(Service.fromJson(aService));
    }

    return allServices;
  }

  Future<List<Service>> getDriverServices(String driverID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/drivers/$driverID/services"));

    Map<String, String> header = {
      "embed": "request{address{customer}}, offer{driver{customer}}"
    };

    var response = await backend.getData(header);

    List<Service> allServices = [];
    var aService;

    for (aService in response) {
      allServices.add(Service.fromJson(aService));
    }

    return allServices;
  }

  Future<List<Service>> getAnOfferServices(String offerID) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/services", query: "offerID=$offerID"));

    Map<String, String> header = {
      "embed": "request{address{customer}}, offer{driver{customer}}"
    };

    var response = await backend.getData(header);

    List<Service> allServices = [];
    var aService;

    for (aService in response) {
      allServices.add(Service.fromJson(aService));
    }

    return allServices;
  }
  //
  // Future<List<Offer>> getAllServices(int constant, String customerID) async {
  //   // if constant = 0 it means this is the first call
  //   // if constant >=1 it means the number of loading times.
  //   NetworkHelper backend = NetworkHelper(
  //       url: Uri(
  //           path: "/api/Services",
  //           query: "limit=25&page=$constant&customerID=$customerID"));
  //
  //   Map<String, String> header = {"embed": "all"};
  //
  //   var response = await backend.getData(header);
  //
  //   List<Offer> allOffers = [];
  //   var anOffer;
  //
  //   for (anOffer in response) {
  //     allOffers.add(Offer.fromJson(anOffer));
  //   }
  //   return allOffers;
  // }

  Future<Service> createService(String offerID, String requestID) {}
}
