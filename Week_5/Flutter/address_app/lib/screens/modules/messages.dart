import 'package:flutter/material.dart';

class ShowSnackBarMessages {
  //this constructor will show the snackbar message.
  ShowSnackBarMessages(
      {required String message,
      required Color color,
      required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class ShowAlertMessage {
  ShowAlertMessage(String title, String content, BuildContext context,[Future<void> Function()? function]) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () {
                    function!();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Yes"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("No"),
                ),
              ],
            ));
  }
}
