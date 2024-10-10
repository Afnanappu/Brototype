import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/constants/screen_size.dart';

// ignore: must_be_immutable
class AppBarForSubWithEdit extends StatelessWidget {
  AppBarForSubWithEdit({
    super.key,
    required this.title,
    this.icon = Icons.edit_outlined,
    this.onPressed,
    this.isAddIcon = true,
  });

  final String title;
  final IconData icon;
  void Function()? onPressed;
  final bool isAddIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon:const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: MyFontStyle.mainSub,
      ),
      actions: [
        (isAddIcon == true)
            ? IconButton(
                onPressed: onPressed,
                icon: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: MyColors.blackShade,
                  ),
                ),
              )
            : SizedBox(
                width: MyScreenSize.screenWidth * 0.03,
              )
      ],
    );
  }
}
