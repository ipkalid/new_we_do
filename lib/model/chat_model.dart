import 'network_helper.dart';

class Chat {
  String chatID;
  String status;

  Chat({this.chatID, this.status});

  Chat.fromJson(Map<String, dynamic> json) {
    chatID = json["chatID"];
    status = json["status"];
  }

  Future<String> createS(String offerID, String customerID, String description,
      String addressID) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(
            path: "/api/customers/$customerID/Requests",
            query: "isSpecific=1"));

    var body = {
      "offerID": offerID,
      "description": description,
      "addressID": addressID,
    };

    var response = await backend.postData(body);

    return response;
  }
}
