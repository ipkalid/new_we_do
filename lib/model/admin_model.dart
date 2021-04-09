class Admin {
  String adminID;
  String email;
  String password;

  Admin({this.adminID, this.email, this.password});

  Admin.fromJson(Map<String, dynamic> json) {
    adminID = json["adminID"];
    email = json["email"];
    password = json["password"];
  }
}
