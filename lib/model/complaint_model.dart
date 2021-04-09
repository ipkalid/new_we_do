import 'network_helper.dart';

// no need for revision

class Complaint {
  String serviceID;
  String complaintID;
  String adminID;
  String customerID;
  String driverID;
  String initiatedBy;
  String title;
  String description;
  String status;

  Complaint(
      {this.serviceID,
      this.complaintID,
      this.adminID,
      this.customerID,
      this.driverID,
      this.initiatedBy,
      this.title,
      this.description,
      this.status});

  Complaint.fromJson(Map<String, dynamic> json) {
    serviceID = json["serviceID"];
    complaintID = json["complaintID"];
    adminID = json["adminID"];
    customerID = json["customerID"];
    driverID = json["driverID"];
    initiatedBy = json["initiatedBy"];
    title = json["title"];
    description = json["description"];
    status = json["status"];
  }

  // UC10 and UC11 - COMPLETE
  Future<String> fileComplain(
    String serviceID,
    String title,
    String description,
    String driverID,
    String initiatedBy,
    String customerID,
  ) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/services/$serviceID/complaints"));

    var body = {
      "title": title,
      "description": description,
      "driverID": driverID,
      "initiatedBy": initiatedBy,
      "customerID": customerID,
    };

    var response = await backend.postData(body);

    return response;
  }
}
