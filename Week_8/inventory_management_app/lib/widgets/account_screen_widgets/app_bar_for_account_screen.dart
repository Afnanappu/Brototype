import 'package:flutter/material.dart';
import 'package:inventory_management_app/screens/first_screens/password_screen.dart';
import 'package:inventory_management_app/widgets/common/alert_dialog.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_main.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';

class AppBarForAccountScreen extends StatelessWidget {
  const AppBarForAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarForMain(
      title: "Account",
      icon: Icons.logout,
      onPressed: () {
        customAlertBox(
          context: context,
          title: 'LogOut',
          content: 'Are you sure?',
          onPressedYes: () {
            CustomSnackBarMessage(
              context: context,
              message: 'Log out completed successfully',
              color: Colors.blue,
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => const PasswordScreen(),
              ),
              (route) => false,
            );
          },
        );
      },
    );
  }
}
