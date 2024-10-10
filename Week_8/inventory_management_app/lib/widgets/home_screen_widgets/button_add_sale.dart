import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

Widget buttonAddSale(
    {required String text,
    void Function()? onTap,
    double radius = 15,
    bool haveBorder = false,
    Color btnColor = MyColors.green}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(radius),
          border: haveBorder==true?Border.all(color: MyColors.green):null,
        ),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
                color: haveBorder == false?MyColors.white:MyColors.green,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}
