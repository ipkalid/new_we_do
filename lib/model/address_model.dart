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
