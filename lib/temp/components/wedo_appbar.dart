import 'package:flutter/material.dart';
import '../../style/constant.dart';

class WedoAppBar {
  AppBar appbar({title: String, onPressed: Function, pageContext: Object}){
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        onPressed: onPressed,
      ),
      title: Text(title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 0.055*displayWidth(pageContext),
          fontWeight: FontWeight.w500
        ),
      ),
      backgroundColor: mainYellow,
    );
  }
  AppBar centerAppBar({title: String, pageContext: Object}){
    return AppBar(
      title: Center(
        child: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 0.055*displayWidth(pageContext),
              fontWeight: FontWeight.w500
          ),
        ),
      ),
      backgroundColor: mainYellow,
    );
  }

}