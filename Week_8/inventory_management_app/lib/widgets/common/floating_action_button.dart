import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/screen_size.dart';

class FloatingActionButtonForAll extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final Color color;
  const FloatingActionButtonForAll({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon = Icons.add,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>   SizedBox(
        width: (constraints.maxWidth < 600)? MyScreenSize.screenWidth * 0.41: MyScreenSize.screenWidth * 0.2,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: MyColors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: const TextStyle(color: MyColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
