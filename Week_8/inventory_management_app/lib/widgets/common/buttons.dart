import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  Color color;
  String text;
  void Function() function;
  double vPadding;
  MyButton({
    super.key,
    required this.color,
    required this.text,
    required this.function,
    this.vPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPadding),
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => MyColors.green,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: MyColors.white),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyCustomButton extends StatelessWidget {
  void Function()? onTap;
  final Color color;
  final String text;
  final Color? textColor;
  final bool haveBgColor;
  final bool isSale;
  MyCustomButton({
    super.key,
    this.isSale = true,
    required this.color,
    required this.text,
    this.textColor,
    this.haveBgColor = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          color: (haveBgColor == true) ? color : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? (isSale == true
                    ? MyColors.green
                    : MyColors.red),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
