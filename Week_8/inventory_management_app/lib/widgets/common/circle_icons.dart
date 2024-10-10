import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

Widget customCircleIconButton({
  required void Function()? onPressed,
  required IconData icon,
  Color? bgColor = MyColors.white,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        icon,
        color: MyColors.blackShade,
      ),
    ),
  );
}
