import 'package:flutter/material.dart';
import 'package:inventory_management_app/screens/sub_screens/brands_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/business_profile_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/purchase_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/settings_screen.dart';
import 'package:inventory_management_app/widgets/account_screen_widgets/list_tile.dart';

class AllListTileForAccountScreen extends StatelessWidget {
  const AllListTileForAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myListTile(
            context: context,
            title: 'Business Profile',
            icon: Icons.business,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AccountProfile()),
              );
            }),
        myListTile(
          context: context,
          title: 'Brands',
          icon: Icons.category_outlined,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => AccountBrands()),
            );
          },
        ),
        myListTile(
          context: context,
          title: 'Purchases',
          icon: Icons.shopping_cart_outlined,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const PurchaseScreen()),
          ),
        ),
        myListTile(
          context: context,
          title: 'Settings',
          icon: Icons.settings,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) =>  SettingsScreen()),
          ),
        ),
      ],
    );
  }
}
