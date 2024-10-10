import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';

Widget myListTile({
  required BuildContext context,
  required String title,
   IconData icon = Icons.add,
  void Function()? onTap,
  bool haveTrailing = false,
  bool haveLeading = true,
  IconData trailIcon = Icons.edit_outlined,
  Widget? trailingWidget,
}) {
  return Card(
    elevation: 0.5,
    color: MyColors.lightGrey,
    margin: const EdgeInsets.symmetric(vertical: 12),
    child: ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: MyFontStyle.listTileFont,
      ),
      leading: (haveLeading == true)?Icon(
        icon,
        size: 30,
        color: MyColors.blackShade,
      ):null,
      trailing: (haveTrailing == true && trailingWidget == null)?Icon(
        trailIcon,
        size: 26,
        color: MyColors.blackShade,
      ): trailingWidget,
    ),
  );
}
