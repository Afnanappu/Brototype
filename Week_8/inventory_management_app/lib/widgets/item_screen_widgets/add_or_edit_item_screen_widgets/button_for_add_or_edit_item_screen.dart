// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_or_edit_new_item_screen.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';

class ButtonForAddOrEditItemScreen extends StatelessWidget {
  const ButtonForAddOrEditItemScreen({
    super.key,
    required this.widget,
    required GlobalKey<FormState> formKey,
    required this.imageNotifier,
    required this.webImageNotifier,
    required this.nowBrandId,
    required TextEditingController itemNameController,
    required TextEditingController itemPriceController,
    required TextEditingController itemColorController,
    required TextEditingController itemRamController,
    required TextEditingController itemStorageController,
    required TextEditingController itemDescriptionController,
    required TextEditingController itemStockController,
  })  : _formKey = formKey,
        _itemNameController = itemNameController,
        _itemPriceController = itemPriceController,
        _itemColorController = itemColorController,
        _itemRamController = itemRamController,
        _itemStorageController = itemStorageController,
        _itemDescriptionController = itemDescriptionController,
        _itemStockController = itemStockController;

  final ItemAddNew widget;
  final GlobalKey<FormState> _formKey;
  final ValueNotifier<String?> imageNotifier;
  final ValueNotifier<Uint8List?> webImageNotifier;
  final int? nowBrandId;
  final TextEditingController _itemNameController;
  final TextEditingController _itemPriceController;
  final TextEditingController _itemColorController;
  final TextEditingController _itemRamController;
  final TextEditingController _itemStorageController;
  final TextEditingController _itemDescriptionController;
  final TextEditingController _itemStockController;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      vPadding: 5,
      color: MyColors.green,
      text: (widget.isAddingItem == true) ? 'Add to items' : 'Save Changes',
      function: () async {
        try {
          if (_formKey.currentState!.validate()) {
            if ((kIsWeb && webImageNotifier.value == null) ||
                (!kIsWeb && imageNotifier.value == null)) {
              CustomSnackBarMessage(
                  context: context,
                  message: 'Image is not added, please add image!',
                  color: MyColors.red);
            } else {
              final String image;
              if (kIsWeb) {
                image = base64Encode(webImageNotifier.value!);
              } else {
                image = imageNotifier.value!;
              }
              final item = ItemModel(
                id: (widget.itemModel != null) ? widget.itemModel!.id! : null,
                brandId: nowBrandId!,
                itemName: _itemNameController.text.trim(),
                itemImage: image,
                itemPrice: double.parse(_itemPriceController.text.trim()),
                color: [..._itemColorController.text.trim().split(',')],
                ram: [..._itemRamController.text.trim().split(',')],
                rom: [..._itemStorageController.text.trim().split(',')],
                description: _itemDescriptionController.text.trim(),
                stock: int.parse(
                  _itemStockController.text.trim(),
                ),
              );
              if (widget.isAddingItem == true) {
                await addItemToDB(item);
                CustomSnackBarMessage(
                    context: context,
                    message: 'Item added successfully',
                    color: MyColors.green);
              } else {
                await editItemFromDB(widget.itemModel!.id!, item);
                if (widget.removeBelowRoute == true) {
                  Navigator.of(context)
                      .removeRouteBelow(ModalRoute.of(context)!);
                }
                CustomSnackBarMessage(
                    context: context,
                    message: 'Item edited successfully',
                    color: MyColors.green);
              }
              Navigator.of(context).pop();
            }
          }
        } catch (e) {
          CustomSnackBarMessage(
              context: context,
              message: 'Error while adding new item',
              color: MyColors.red);
        }
        notifyAnyListeners(itemFilterListNotifiers);
      },
    );
  }
}
