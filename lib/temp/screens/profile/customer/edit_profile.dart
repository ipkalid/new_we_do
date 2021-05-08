import 'package:flutter/material.dart';
import 'package:we_do/helper/hive_preferences.dart';
import 'package:we_do/model/customer_model.dart';
import '../../../../style/style.dart';
import '../../../components/button_with_icon.dart';
import '../../../components/main_button.dart';
import '../../../components/text_field_with_label.dart';
import '../../../../style/constant.dart';
import '../../../components/wedo_appbar.dart';
import 'change_password.dart';
import 'select_address.dart';

class EditProfile extends StatefulWidget {
  EditProfile();
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Customer local;

  Future<void> getCustomer() async {
    local = await Customer.signIn(globalPhoneNumber);
  }

  @override
  void initState() {
    super.initState();
    getCustomer();
  }

  String newUserName;
  String newPhoneNumber;
  Color nameBorderColor = fieldBorderColor;
  Color phoneNumberBorderColor = fieldBorderColor;
  bool correctFields = true;
  Text message = Text("");
  WedoAppBar appBar = WedoAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar.appbar(
          title: "Profile",
          onPressed: () {
            Navigator.pop(context);
          },
          pageContext: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Container(
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
                ),
                SizedBox(
                  height: 30,
                ),
                Center(child: message),
                SizedBox(
                  height: 5,
                ),
                TextFieldWithLabel(
                  onChanged: (value) {
                    if (value == '') {
                      nameBorderColor = Colors.red;
                      correctFields = false;
                    } else {
                      newUserName = value;
                      nameBorderColor = fieldBorderColor;
                    }
                  },
                  label: "Name",
                  //TODO: use the real variables
                  hintText: local.name,
                  borderColor: nameBorderColor,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWithLabel(
                  onChanged: (value) {
                    if (value == '') {
                      correctFields = false;
                      phoneNumberBorderColor = Colors.red;
                    } else {
                      newPhoneNumber = value;
                      phoneNumberBorderColor = fieldBorderColor;
                    }
                  },
                  label: "Mobile Number",
                  hintText: local.phoneNumber,
                  inputType: TextInputType.number,
                  borderColor: phoneNumberBorderColor,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWithIcon(
                    icon: Icons.vpn_key_outlined,
                    text: "Change Password",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChangePassword();
                      }));
                    }),
                SizedBox(
                  height: 20,
                ),
                ButtonWithIcon(
                    icon: Icons.location_on_outlined,
                    text: "Address",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SelectAddress();
                      }));
                    }),
                SizedBox(
                  height: 80,
                ),
                MainButton(
                    onPressed: () {
                      setState(() {
                        if (!correctFields) {
                          message = Text(
                            "Please fill the empty fields",
                            style: warningTextStyle(context),
                          );
                        } else {
                          //TODO: update the profile in the database
                          if (local.name != newUserName && newUserName != '') {
                            local.name = newUserName;
                            local.changeData();
                          }
                          if (local.phoneNumber != newPhoneNumber &&
                              newPhoneNumber != '') {
                            local.phoneNumber = newPhoneNumber;
                            local.changeData();
                          }
                          message = Text(
                            "Your profile has been updated",
                            style: successfulTextStyle(context),
                          );
                        }
                      });
                    },
                    text: "Save"),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
