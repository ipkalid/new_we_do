import 'package:we_do/model/customer_model.dart';

import 'network_helper.dart';

// revised

class Driver {
  Customer customer;

  String driverID;
  String customerID;
  String kfupmEmail;
  String status;
  int ratingNum;
  double rating;
  int createdAt;

// no need for rating in the creation of a driver

  // TODO: DELETE THIS.CUSTOMER after finishing the DUMMY testing
  Driver(
      {this.driverID,
      this.kfupmEmail,
      this.status,
      this.rating,
      this.customer});

  Driver.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("customerID"))
      customerID = json["customerID"];
    else {
      customer = Customer.fromJson(json["customer"]);
      customerID = customer.customerID;
    }

    driverID = json["driverID"];
    kfupmEmail = json["kfupmEmail"];
    status = json["status"];
    ratingNum = json["ratingNum"];

    if (json["rating"] != null)
      rating = json["rating"];
    else
      rating = 0;

    createdAt = json["createdAt"];
  }

  // UC12 - COMPLETE
  Future<String> rateDriver(String driverID, int rating) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/drivers/$driverID"));

    // TODO: IS THIS AN ISSUE?
    Map<String, dynamic> body = {"rating": rating};

    var response = backend.putData(body);

    return response;
  }
}
