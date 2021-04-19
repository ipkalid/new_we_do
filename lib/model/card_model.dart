class CreditCard {
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

  CreditCard(
      {this.walletID,
      this.cardID,
      this.title,
      this.name,
      this.number,
      this.expiredDate,
      this.iban,
      this.status});

  CreditCard.fromJson(Map<String, dynamic> json) {
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

var carddd = CreditCard(
  iban: "3265786478213",
  name: "ALahli",
  expiredDate: 11919,
  number: "24242424",
);
