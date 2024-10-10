import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

Widget popUpIconButtonForAll(
    {IconData icon = Icons.more_vert,
    required List<PopupMenuEntry<dynamic>> Function(BuildContext context)
        itemBuilder}) {
  return PopupMenuButton(
    color: MyColors.white,
    icon: Icon(icon),
    iconColor: MyColors.blackShade,
    itemBuilder: itemBuilder,
  );
}
