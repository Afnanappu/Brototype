import 'package:flutter/material.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_main.dart';
import 'package:inventory_management_app/widgets/common/popup_icon_button_for_all.dart';

class AppBarForItemScreen extends StatelessWidget {
  const AppBarForItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarForMain(
      title: 'Item',
      haveBorder: false,
      isPopupMenuButton: true,
      popupMenuButton: popUpIconButtonForAll(
        icon: Icons.filter_alt_outlined,
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {
              getTheFilterItem();
            },
            child: const Text('All item'),
          ),
          PopupMenuItem(
            onTap: () {
              getTheFilterItem(limit: 0, isLess: false);
            },
            child: const Text('In stock'),
          ),
          PopupMenuItem(
            onTap: () {
              getTheFilterItem(limit: 1);
            },
            child: const Text('Out of stock item'),
          ),
        ],
      ),
    );
  }
}
