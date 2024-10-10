import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/item_screen_widgets/item_list_tile.dart';

class ItemListForItemScreen extends StatelessWidget {
  const ItemListForItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: itemFilterListNotifiers,
      builder: (context, itemModel, child) =>
          itemFilterListNotifiers.value.isNotEmpty
              ? ListView.builder(
                  itemCount: itemModel.length,
                  itemBuilder: (context, index) {
                    return ItemListTile(
                      index: index,
                      itemModel: itemModel[index],
                    );
                  },
                )
              : const Center(
                  child: Text('No item found'),
                ),
    );
  }
}
