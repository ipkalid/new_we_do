import 'network_helper.dart';

// you cant specify the reason for the weakness in the report...like mansour is the problem or etc...

// revision is done

// TODO: SAVE ALL THE DATA IN HIVE (add verification with each request)

class Customer {
  String customerID;
  String name;
  String driverID;
  String walletID;
  String phoneNumber;
  String picURL;
  String password;
  String status;
  int ratingNum;
  double rating;
  int createdAt;

  Customer(
      {this.customerID,
      this.name,
      this.driverID,
      this.walletID,
      this.phoneNumber,
      this.picURL,
      this.password,
      this.status,
      this.ratingNum,
      this.rating});

  Customer.fromJson(Map<String, dynamic> json) {
    customerID = json["customerID"];
    name = json["name"];
    driverID = json["driverID"];
    walletID = json["walletID"];
    phoneNumber = json["phoneNumber"];
    picURL = json["picURL"];
    password = json["password"];
    status = json["status"];
    ratingNum = json["ratingNum"];

    if (json["rating"] != null)
      rating = json["rating"];
    else
      rating = 0;

    createdAt = json["createdAt"];
  }

  // UC01 - complete
  static Future signUp(String phoneNumber, String name, String password) async {
    NetworkHelper backend = NetworkHelper(url: Uri(path: "/api/customers"));

    // TODO: HASHING
    Map<String, String> body = {
      "phoneNumber": phoneNumber,
      "name": name,
      "password": password
    };

    var response = await backend.postDataTemp(body);

    if (response is String)
      return response;
    else if (response == []) {
      return "no user with this phone number";
    } else {
      return Customer.fromJson(response);
    }
  }

  // UC04 -
  //Mansour
  static Future signIn(String phoneNumber) async {
    NetworkHelper backend = NetworkHelper(
        url: Uri(path: "/api/customers"), query: "phoneNumber=$phoneNumber");

    var response = await backend.getData({});

    if (response is String)
      return response;
    else if (response == []) {
      return "no user with this phone number";
    } else {
      return Customer.fromJson(response[0]);
    }
  }

  // UC02 - complete
  static Future<String> activateDriverSide(
      String customerID, String kfupmEmail) async {
    NetworkHelper backend = NetworkHelper(url: Uri(path: "/api/drivers"));

    var body = {
      "customerID": customerID,
      "kfupmEmail": kfupmEmail,
    };

    var response = await backend.postDataTemp(body);
    print(response);

    return response;
  }

  // UC05 - complete
  // Upon agreeing with the developer who needs this function, this is the only
  // function in our system that requires the developer to fill the constructor before calling the function
  Future<String> changeData() async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$customerID"));

    var body = {
      "name": name,
      "phoneNumber": phoneNumber,
      "picURL": picURL,
      "password": password
    };

    var response = await backend.putData(body);

    return response;
  }

  // UC13 - COMPLETE
  static Future<String> rateCustomer(String customerID, int rating) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/customers/$customerID"));

    // TODO: IS THIS AN ISSUE?
    Map<String, dynamic> body = {"rating": rating};

    var response = backend.putData(body);

    return response;
  }
}
