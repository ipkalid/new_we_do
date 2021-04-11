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

  void changeStatus(String newStatus) {}

  Future<List<Service>> getCustomerServices(String customerID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$customerID/services"));

    Map<String, String> header = {
      "embed": "request{customer}, offer{driver{customer}}"
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

var serviceeee = Service(
    request: requestttt, offer: offereeeee, orderCost: 33, status: "Deliverd");
