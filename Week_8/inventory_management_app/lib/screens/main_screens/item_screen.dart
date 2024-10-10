import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/screens/sub_screens/add_or_edit_new_item_screen.dart';
import 'package:inventory_management_app/widgets/common/floating_action_button.dart';
import 'package:inventory_management_app/widgets/item_screen_widgets/app_bar_for_item_screen.dart';
import 'package:inventory_management_app/widgets/item_screen_widgets/item_list_for_item_screen.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getTheFilterItem();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 60),
        child: AppBarForItemScreen(),
      ),
      body: FutureBuilder(
              future: getAllItemFormDB(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return const ItemListForItemScreen();
                }
              },
            ),
      floatingActionButton: FloatingActionButtonForAll(
        text: "Add new item",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const ItemAddNew(),
            ),
          );
        },
        color: MyColors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
