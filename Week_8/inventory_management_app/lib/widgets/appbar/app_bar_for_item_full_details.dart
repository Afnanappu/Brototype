import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/widgets/common/circle_icons.dart';

// ignore: must_be_immutable
class AppBarForItemFullDetails extends StatelessWidget {
  void Function()? onPressed;
  AppBarForItemFullDetails({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: customCircleIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.arrow_back_ios_new),
      backgroundColor: MyColors.transparent,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: customCircleIconButton(
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
                icon: Icons.edit_outlined)),
      ],
    );
  }
}
