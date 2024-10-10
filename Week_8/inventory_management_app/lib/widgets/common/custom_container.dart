import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/screen_size.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  final bool haveBgColor;
  final String title;
  final String subtitle;
  double? height;
  double? width;

  CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.haveBgColor = true,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 115,
      // width: 145,
      width: width ??= MyScreenSize.screenWidth * 0.44,
      height: height ??= MyScreenSize.screenWidth * 0.36,
      decoration: BoxDecoration(
          color: (haveBgColor == true) ? MyColors.green : null,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: MyColors.green, width: 1.5)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: (haveBgColor == true) ? MyColors.white : MyColors.green,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: (haveBgColor == true) ? MyColors.white : MyColors.green,
                fontSize: 24,
                fontWeight: FontWeight.w700),
            softWrap: true,
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
