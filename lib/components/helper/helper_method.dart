import 'package:flutter/material.dart';
import 'package:we_do/components/helper/custom_button_sheet.dart';

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

  static void showBottomSheet(
      {@required BuildContext context,
      @required Widget child,
      double height = 0.5}) {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (ctx) {
        return CustomBottomSheet(child: child, height: height);
      },
    );
  }

  static void showSimpleDialog({
    @required BuildContext context,
    @required Widget child,
  }) {
    showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          children: [child],
        );
      },
    );
  }
}
