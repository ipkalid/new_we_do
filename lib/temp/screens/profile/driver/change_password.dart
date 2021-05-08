import 'package:flutter/material.dart';
import 'package:we_do/model/customer_model.dart';
import '../../../../style/constant.dart';
import '../../../../style/style.dart';
import '../../../components/main_button.dart';
import '../../../components/text_field_with_label.dart';
import '../../../components/wedo_appbar.dart';

class ChangePassword extends StatefulWidget {
  final Customer local;

  const ChangePassword({Key key, this.local}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState(local);
}

class _ChangePasswordState extends State<ChangePassword> {
  final Customer local;
  _ChangePasswordState(this.local);

  String oldPassword = '', newPassword = '', confirmedNewPassword = '';
  Color oldPasswordColor = fieldBorderColor;
  Color newPasswordColor = fieldBorderColor;
  Color confirmedNewPasswordColor = fieldBorderColor;

  String passwordStatus = "Show";

  Text message = Text("");

  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    //WedoAppBar appBar = WedoAppBar();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text("Password",
          style: TextStyle(
              color: Colors.black,
              fontSize: 0.055*displayWidth(context),
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Color(0xff7AA4E3),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: ListView(
          children: <Widget>[
            message,
            SizedBox(height: 5,),
            TextFieldWithLabel(
                onChanged: (value){oldPassword = value;},
              label: "Old password",
              hintText: "*************",
              visibility: passwordVisibility,
              borderColor: oldPasswordColor,
              suffix: MaterialButton(
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    if(passwordVisibility == true){
                      passwordVisibility = false;
                      passwordStatus = "Show";
                    }
                    else{
                      passwordVisibility = true;
                      passwordStatus = "Hide";
                    }
                  });
                },
                child: Text(
                  passwordStatus,
                  style: TextStyle(
                    color: mainOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 0.042 * displayWidth(context),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextFieldWithLabel(
              onChanged: (value){newPassword = value;},
              label: "New password",
              hintText: "New password",
              visibility: passwordVisibility,
              borderColor: newPasswordColor,
              suffix: MaterialButton(
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    if(passwordVisibility == true){
                      passwordVisibility = false;
                      passwordStatus = "Show";
                    }
                    else{
                      passwordVisibility = true;
                      passwordStatus = "Hide";
                    }
                  });
                },
                child: Text(
                  passwordStatus,
                  style: TextStyle(
                    color: mainOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 0.042 * displayWidth(context),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextFieldWithLabel(
              onChanged: (value){confirmedNewPassword = value;},
              label: "Confirmed password",
              hintText: "Confirmed password",
              visibility: passwordVisibility,
              borderColor: confirmedNewPasswordColor,
              suffix: MaterialButton(
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    if(passwordVisibility == true){
                      passwordVisibility = false;
                      passwordStatus = "Show";
                    }
                    else{
                      passwordVisibility = true;
                      passwordStatus = "Hide";
                    }
                  });
                },
                child: Text(
                  passwordStatus,
                  style: TextStyle(
                    color: mainOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 0.042 * displayWidth(context),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            MainButton(
                onPressed: (){
                  setState(() {
                    if(oldPassword == '' || newPassword == '' || confirmedNewPassword == ''){
                      message = Text("Please fill the empty fields", style: warningTextStyle(context),);
                      oldPassword == '' ? oldPasswordColor = Colors.red : oldPasswordColor = fieldBorderColor;
                      newPassword == '' ? newPasswordColor = Colors.red : newPasswordColor = fieldBorderColor;
                      confirmedNewPassword == '' ? confirmedNewPasswordColor = Colors.red : confirmedNewPasswordColor = fieldBorderColor;
                    }
                    else if (newPassword != confirmedNewPassword){
                      confirmedNewPasswordColor = Colors.red;
                      message = Text("The confirmed password does not match the new password", style: warningTextStyle(context),);
                    }
                    else if (oldPassword != local.password){
                      message = Text("The old password is not correct", style: warningTextStyle(context),);
                    }
                    else{
                      confirmedNewPasswordColor = fieldBorderColor;
                      //TODO: update the password in the database
                      local.password = newPassword;
                      local.changeData();
                      message = Text("Your password has been updated", style: successfulTextStyle(context),);
                    }
                  });
                },
                text: "Save")
          ],
        ),
      ),
    );
  }
}
