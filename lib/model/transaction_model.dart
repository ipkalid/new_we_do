// no need for revision

import 'network_helper.dart';

class Transaction {
  String walletID;
  String transactionID;
  String type;
  // TODO: this is different from the backend (I need to convert it to number before sending it)
  String date;
  double amount;
  String fromID;
  String toID;

  Transaction(
      {this.walletID,
      this.transactionID,
      this.type,
      this.date,
      this.amount,
      this.fromID,
      this.toID});

  Transaction.fromJson(Map<String, dynamic> json) {
    walletID = json["walletID"];
    transactionID = json["transactionID"];
    type = json["type"];
    date = json["date"];
    amount = json["amount"];
    fromID = json["fromID"];
    toID = json["toID"];
  }

  // UC7 - complete
  Future<List<Transaction>> getCustomerTransactions(
      int constant, String walletID) async {
    // if constant = 0 it means this is the first call
    // if constant >=1 it means the number of loading times.
    NetworkHelper backend = NetworkHelper(
        url: Uri(
            path: "/api/wallets/$walletID/transactions",
            query: "limit=25&page=$constant"));

    var response = await backend.getData({});

    List<Transaction> allTransactions = [];
    var aTransaction;

    for (aTransaction in response) {
      allTransactions.add(Transaction.fromJson(aTransaction));
    }

    return allTransactions;
  }
}

Transaction transss = Transaction(
  type: "ddd",
  date: "2020/20/20",
  amount: 23,
);
