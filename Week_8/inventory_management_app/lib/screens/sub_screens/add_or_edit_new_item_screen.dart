import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/functions/reg_exp_functions.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/drop_down_for_all.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';
import 'package:inventory_management_app/widgets/item_screen_widgets/add_or_edit_item_screen_widgets/add_item_image_for_add_or_edit_item_screen.dart';
import 'package:inventory_management_app/widgets/item_screen_widgets/add_or_edit_item_screen_widgets/button_for_add_or_edit_item_screen.dart';

class ItemAddNew extends StatefulWidget {
  const ItemAddNew({
    super.key,
    this.itemModel,
    this.isAddingItem = true,
    this.removeBelowRoute = true,
  });
  final ItemModel? itemModel;
  final bool isAddingItem;
  final bool removeBelowRoute;

  @override
  State<ItemAddNew> createState() => _ItemAddNewState();
}

class _ItemAddNewState extends State<ItemAddNew> {
  final _itemNameController = TextEditingController();

  final _itemPriceController = TextEditingController();

  final _itemStockController = TextEditingController();

  final _itemColorController = TextEditingController();

  final _itemRamController = TextEditingController();

  final _itemStorageController = TextEditingController();

  final _itemDescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<String?> imageNotifier = ValueNotifier(null);
  ValueNotifier<Uint8List?> webImageNotifier = ValueNotifier(null);

  int? nowBrandId;

  @override
  void initState() {
    if (widget.itemModel != null) {
      nowBrandId = widget.itemModel!.brandId;

      imageNotifier.value = widget.itemModel!.itemImage;

      _itemNameController.text = widget.itemModel!.itemName;
      _itemPriceController.text = widget.itemModel!.itemPrice.toString();
      _itemStockController.text = widget.itemModel!.stock.toString();
      _itemColorController.text = widget.itemModel!.color.join(', ');
      _itemRamController.text = widget.itemModel!.ram.join(', ');
      _itemStorageController.text = widget.itemModel!.rom.join(', ');
      _itemDescriptionController.text = widget.itemModel!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: (widget.isAddingItem == true) ? 'Add Item' : 'Edit Item',
          isAddIcon: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AddItemImageForAddOrEditItemScreen(
                    imageNotifier: imageNotifier,
                    webImageNotifier: webImageNotifier,
                  ),

                  //Item name
                  customFormField(
                    context: context,
                    labelText: 'Item name',
                    controller: _itemNameController,
                    vPadding: 20,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item name is empty, provide a name';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //brand (drop drown button)
                  ValueListenableBuilder(
                      valueListenable: itemBrandListNotifiers,
                      builder: (context, brands, child) {
                        return DropDownForAll(
                          nowValue: nowBrandId,
                          validator: (value) {
                            if (value == null) {
                              return 'No brand is selected, select one';
                            } else {
                              return null;
                            }
                          },
                          items: brands.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e.id,
                                child: Text(e.itemBrandName),
                              );
                            },
                          ).toList(),
                          onChanged: (e) {
                            setState(() {
                              nowBrandId = e;
                            });
                          },
                          hintText: 'Select brand',
                        );
                      }),

                  //price
                  customFormField(
                    context: context,
                    labelText: 'Price',
                    controller: _itemPriceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item price is empty, provide a price';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //stock count
                  customFormField(
                    vPadding: 0,
                    context: context,
                    labelText: 'Stock Count',
                    controller: _itemStockController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item stock count is empty, provide a stock count';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //color
                  customFormField(
                    context: context,
                    labelText: 'Color',
                    controller: _itemColorController,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item have no color!, try to provide';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //ram
                  customFormField(
                    vPadding: 0,
                    context: context,
                    labelText: 'Ram',
                    controller: _itemRamController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item have no ram!, try to provide';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //storage
                  customFormField(
                    context: context,
                    labelText: 'Storage',
                    controller: _itemStorageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item have no storage!, try to provide';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //description
                  customFormField(
                    vPadding: 0,
                    context: context,
                    labelText: 'Description',
                    controller: _itemDescriptionController,
                    validator: (value) {
                      if (value == null ||
                          CustomRegExp.checkEmptySpaces(value)) {
                        return 'item description is empty, provide description';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //---------- Save button ----------//
                  ButtonForAddOrEditItemScreen(
                    widget: widget,
                    formKey: _formKey,
                    imageNotifier: imageNotifier,
                    webImageNotifier: webImageNotifier,
                    nowBrandId: nowBrandId,
                    itemNameController: _itemNameController,
                    itemPriceController: _itemPriceController,
                    itemColorController: _itemColorController,
                    itemRamController: _itemRamController,
                    itemStorageController: _itemStorageController,
                    itemDescriptionController: _itemDescriptionController,
                    itemStockController: _itemStockController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
