import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/model/customer_model.dart';
import '../../../../style/constant.dart';
import '../../../components/button_with_icon.dart';
import '../../../components/wedo_appbar.dart';
import 'edit_profile.dart';
import 'wallet.dart';
//import 'login.dart';

class CustomerAccount extends StatefulWidget {
  @override
  _CustomerAccountState createState() => _CustomerAccountState();
}

class _CustomerAccountState extends State<CustomerAccount> {
  WedoAppBar appbar = WedoAppBar();

  Customer local;
  getCustomer() async{
    Box<String> currentUser;
    currentUser = Hive.box<String>("currentUser");
    String phoneNumber = currentUser.get("phoneNumber");
    local = await Customer.signIn(phoneNumber);
  }

  @override
  void initState() {
    super.initState();
    getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    String customerName = local.name;

    int rating = local.rating as int;

    List<Widget> customerRating = [];

    int starsCounter = rating;
    int missingStarsCounter = 5 - rating;
    while (starsCounter > 0) {
      customerRating.add(Icon(
        Icons.star,
        color: Colors.amber[400],
        size: 25,
      ));
      starsCounter--;
    }
    while (missingStarsCounter > 0) {
      customerRating
          .add(Icon(Icons.star_border, color: Colors.amber[400], size: 25));
      missingStarsCounter--;
    }

    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: appbar.centerAppBar(title: "Profile", pageContext: context),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 25, 8, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: mainYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.perm_identity,
                        size: 0.25 * displayWidth(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //customer name
                  Center(
                      child: Text(
                    customerName,
                    style: TextStyle(
                        fontSize: 0.05 * displayWidth(context),
                        fontWeight: FontWeight.w500),
                  )),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: customerRating,
                    ),
                  ),
                  //rating
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWithIcon(
                              icon: Icons.perm_identity,
                              text: "Profile",
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EditProfile(local: local,);
                                }));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWithIcon(
                              icon: Icons.account_balance_wallet_outlined,
                              text: "Wallet",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wallet()),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWithIcon(
                              icon: Icons.library_books_outlined,
                              text: "Terms and Condition",
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWithIcon(
                              icon: Icons.info_outline,
                              text: "About Us",
                              onPressed: () {}),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: ButtonWithIcon(
                        //       icon: Icons.drive_eta_rounded,
                        //       text: "Log in as Driver",
                        //       onPressed: () {
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //             builder: (context) => DriverLogin()));
                        //       }),
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
