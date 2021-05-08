import 'package:flutter/material.dart';
import '../../style/constant.dart';

class historyAppBar {
  AppBar historyAppbar({title: String, pageContext: Object}){
    return AppBar(
      automaticallyImplyLeading: true,

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