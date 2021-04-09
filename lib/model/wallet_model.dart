import 'network_helper.dart';

// revised

class Wallet {
  String walletID;
  double dBalance;
  double cBalance;

  Wallet({this.walletID, this.dBalance, this.cBalance});

  Wallet.fromJson(Map<String, dynamic> json) {
    walletID = json["walletID"];
    dBalance = json["dBalance"];
    cBalance = json["cBalance"];
  }

  // UC06 - COMPLETE
  Future getWallet(String walletID) async {
    NetworkHelper backend =
        NetworkHelper(url: Uri(path: "/api/wallets/$walletID"));

    var response = await backend.getData({});

    if (response is String)
      return response;
    else {
      return Wallet.fromJson(response);
    }
  }
}
