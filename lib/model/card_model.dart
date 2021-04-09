class Card {
  String walletID;
  String cardID;
  String title;
  String name;
  String number;
  double expiredDate;
  String iban;
  // addedAt will calculated in the backend so no need to put in the constructor
  double addedAt;
  String status;

  Card(
      {this.walletID,
      this.cardID,
      this.title,
      this.name,
      this.number,
      this.expiredDate,
      this.iban,
      this.status});

  Card.fromJson(Map<String, dynamic> json) {
    walletID = json["walletID"];
    cardID = json["cardID"];
    title = json["title"];
    name = json["name"];
    number = json["number"];
    expiredDate = json["expiredDate"];
    iban = json["iban"];
    addedAt = json["addedAt"];
    status = json["status"];
  }
}
