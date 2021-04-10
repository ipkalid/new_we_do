import 'package:flutter/material.dart';

class HelperMethods {
  static void showDialogAlert({
    @required BuildContext context,
    @required String title,
    @required String message,
  }) {
    showDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            message,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Dismiss"),
            ),
          ],
        );
      },
      context: context,
    );
  }

  static void showSnackBar(
      {@required BuildContext context, @required String label}) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(label),
      action: SnackBarAction(
        label: "Dismiss", onPressed: () {},

        //onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
