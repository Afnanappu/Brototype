import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/constants/screen_size.dart';

// ignore: must_be_immutable
class AppBarForMain extends StatelessWidget {
  AppBarForMain({
    super.key,
    required this.title,
    this.icon = Icons.notifications_none,
     this.onPressed,
    this.haveBorder = true,
    this.isPopupMenuButton = false,
    this.popupMenuButton,
  });

  final String title;
  final IconData icon;
  void Function()? onPressed;
  final bool haveBorder;
  final bool isPopupMenuButton;
  final Widget? popupMenuButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: MyColors.lightGrey,
      title: Text(
        title,
        style: MyFontStyle.main,
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: (haveBorder == true)
                  ? Border.all(color: MyColors.darkGrey)
                  : null,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isPopupMenuButton == false ? Icon(icon) : popupMenuButton,
          ),
        ),
        SizedBox(
          width: MyScreenSize.screenWidth * 0.03,
        )
      ],
    );
  }
}
