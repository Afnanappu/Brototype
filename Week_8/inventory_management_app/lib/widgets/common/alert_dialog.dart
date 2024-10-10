import 'package:flutter/material.dart';

void customAlertBox({
  required BuildContext context,
  required String title,
  required String content,
  required void Function()? onPressedYes,
  void Function()? onPressedNo,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onPressedYes,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                if (onPressedNo == null) {
                  Navigator.of(context).pop();
                } else {
                  onPressedNo();
                }
              },
              child: const Text('No'),
            ),
          ],
        );
      });
}
