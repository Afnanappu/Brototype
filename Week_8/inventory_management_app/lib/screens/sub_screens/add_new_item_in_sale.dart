import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/functions/reg_exp_functions.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/models/purchase_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_purchase.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/alert_dialog.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/button_add_sale.dart';
import 'package:inventory_management_app/widgets/common/drop_down_for_all.dart';
import 'package:inventory_management_app/widgets/common/text_form_field.dart';
import 'package:inventory_management_app/functions/extension_methods.dart';

class AddNewItemInSale extends StatefulWidget {
  final ItemModel? itemModel;
  final SaleModel? saleModel;
  final PurchaseItemModel? purchaseItemModel;
  final bool isPurchase;
  final bool isEditable;
  const AddNewItemInSale({
    super.key,
    this.itemModel,
    this.isPurchase = false,
    this.isEditable = false,
    this.saleModel,
    this.purchaseItemModel,
  });

  @override
  State<AddNewItemInSale> createState() => _AddNewItemInSaleState();
}

class _AddNewItemInSaleState extends State<AddNewItemInSale> {
  final _itemPriceController = TextEditingController();

  final _itemStockController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int selectedItemQuantity = 0;

  ItemModel? item;

  @override
  void initState() {
    if (widget.itemModel != null) {
      item = widget.itemModel;
    }
    if (widget.saleModel != null) {
      _itemStockController.text = widget.saleModel!.itemCount.toString();
    } else {
      _itemStockController.text = '1';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      _itemPriceController.text = item!.itemPrice.toString();
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title:
              'Add item to ${widget.isPurchase == false ? 'Sale' : 'Purchase'}',
          isAddIcon: false,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              DropDownForAll(
                nowValue: item,
                formFillColor: MyColors.white,
                haveBorder: true,
                items: itemModelListNotifiers.value
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.itemName),
                      ),
                    )
                    .toList(),
                onChanged: (e) {
                  setState(() {
                    item = e;
                    for (var element in currentSaleItemNotifier.value) {
                      if (element.itemId == item!.id) {
                        selectedItemQuantity += element.itemCount;
                      }
                    }
                  });
                },
                hintText: 'Select item',
                validator: (value) {
                  if (value == null) {
                    return 'Select an item';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: customFormField(
                      context: context,
                      labelText: 'Price',
                      controller: _itemPriceController,
                      formFillColor: MyColors.white,
                      haveBorder: true,
                      isFormEnabled: false,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: customFormField(
                      context: context,
                      labelText: 'Quantity',
                      controller: _itemStockController,
                      keyboardType: TextInputType.number,
                      formFillColor: MyColors.white,
                      haveBorder: true,
                      validator: (value) {
                        int quantity = 1;
                        int stock = item!.stock - selectedItemQuantity;
                        if (CustomRegExp.checkEmptySpaces(value!)) {
                          return "add quantity";
                        } else if (!CustomRegExp.checkNumberOnly(value)) {
                          return 'Enter a valid quantity';
                        } else if (widget.isPurchase == false) {
                          quantity = int.parse(value);
                          if (item != null && quantity > stock) {
                            return 'out of stock ${stock == 0 ? 'item' : ', try $stock'} ';
                          } else {
                            return null;
                          }
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 85,
        color: MyColors.white,
        child: (widget.isEditable == false)
            ? Row(
                children: [
                  Expanded(
                    child: buttonAddSale(
                      text: 'Save&New',
                      haveBorder: true,
                      btnColor: MyColors.transparent,
                      //todo: Add function to save data
                      onTap: _saveAndNewForSale,
                    ),
                  ),
                  Expanded(
                    child: buttonAddSale(
                      text: 'Save',
                      onTap: _saveForSale,
                    ),
                  ),
                ],
              )
            : buttonAddSale(
                text: 'Save',
                onTap: _saveForSaleEditable,
              ),
      ),
    );
  }

  //Function for adding multiple sale
  void _saveAndNewForSale() {
    if (_formKey.currentState!.validate()) {
      final itemCount = _itemStockController.text.parseInt();
      final itemPrice = _itemPriceController.text.parseDouble();

      //sales function
      if (widget.isPurchase == false) {
        final int index = currentSaleItemNotifier.value.indexWhere(
          (element) => element.itemId == item!.id,
        );

        //if item is already in the current sale list, for adding new or update the existing sale.
        //if found sale
        if (index != -1) {
          customAlertBox(
            context: context,
            title: 'Item already exist',
            content: 'Whould you like to add this item to the existing item.',
            onPressedYes: () {
              final sameItem = currentSaleItemNotifier.value.elementAt(index);
              sameItem.itemCount += itemCount;
              notifyAnyListeners(totalAmountNotifier);
              notifyAnyListeners(currentSaleItemNotifier);

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AddNewItemInSale(),
                ),
              );
            },
            onPressedNo: () {
              final sale = SaleModel(itemId: item!.id!, itemCount: itemCount);
              currentSaleItemNotifier.value.add(sale);
              notifyAnyListeners(currentSaleItemNotifier);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AddNewItemInSale(),
                ),
              );
            },
          );
        }

        //if sale not found add new
        else {
          final sale = SaleModel(itemId: item!.id!, itemCount: itemCount);
          currentSaleItemNotifier.value.add(sale);
          notifyAnyListeners(currentSaleItemNotifier);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const AddNewItemInSale(),
            ),
          );
        }
        final double sum = itemCount.toDouble() * itemPrice!;
        totalAmountNotifier.value += sum;
      }

      //Purchase funciton
      else {
        final int index = currentPurchaseListNotifier.value.indexWhere(
          (element) => element.itemId == item!.id,
        );

        //if item is already in the current sale list, for adding new or update the existing sale.
        //if found sale
        if (index != -1) {
          customAlertBox(
            context: context,
            title: 'Item already exist',
            content: 'Whould you like to add this item to the existing item.',
            onPressedYes: () {
              final sameItem =
                  currentPurchaseListNotifier.value.elementAt(index);
              sameItem.quantity += itemCount;
              notifyAnyListeners(currentPurchaseListNotifier);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AddNewItemInSale(),
                ),
              );
            },
            onPressedNo: () {
              final purchase =
                  PurchaseItemModel(itemId: item!.id!, quantity: itemCount);
              currentPurchaseListNotifier.value.add(purchase);
              notifyAnyListeners(currentPurchaseListNotifier);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const AddNewItemInSale(),
                ),
              );
            },
          );
        }

        //if sale not found add new
        else {
          final purchase =
              PurchaseItemModel(itemId: item!.id!, quantity: itemCount);
          currentPurchaseListNotifier.value.add(purchase);
          notifyAnyListeners(currentPurchaseListNotifier);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const AddNewItemInSale(
                isPurchase: true,
              ),
            ),
          );
        }
      }
      final sum = itemCount.toDouble() * itemPrice!;
      totalAmountNotifier.value += sum;
    }
  }

  //Function for adding new sale in normal conditon
  void _saveForSale() {
    if (_formKey.currentState!.validate()) {
      final itemCount = _itemStockController.text.parseInt();
      final itemPrice = _itemPriceController.text.parseDouble();

      //sales function
      if (widget.isPurchase == false) {
        final int index = currentSaleItemNotifier.value.indexWhere(
          (element) => element.itemId == item!.id,
        );
        if (index != -1) {
          customAlertBox(
            context: context,
            title: 'Item already exist',
            content: 'Whould you like to add this item to the existing item.',
            onPressedYes: () {
              final sameItem = currentSaleItemNotifier.value.elementAt(index);
              sameItem.itemCount += itemCount;
              notifyAnyListeners(totalAmountNotifier);
              notifyAnyListeners(currentSaleItemNotifier);

              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPressedNo: () {
              final sale = SaleModel(itemId: item!.id!, itemCount: itemCount);
              currentSaleItemNotifier.value.add(sale);
              notifyAnyListeners(currentSaleItemNotifier);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          );
        } else {
          final sale = SaleModel(itemId: item!.id!, itemCount: itemCount);
          currentSaleItemNotifier.value.add(sale);
          notifyAnyListeners(currentSaleItemNotifier);
          Navigator.of(context).pop();
        }
      }

      //purchase functions
      else {
        final int index = currentPurchaseListNotifier.value.indexWhere(
          (element) => element.itemId == item!.id,
        );

        if (index != -1) {
          customAlertBox(
            context: context,
            title: 'Item already exist',
            content: 'Whould you like to add this item to the existing item.',
            onPressedYes: () {
              final sameItem =
                  currentPurchaseListNotifier.value.elementAt(index);
              sameItem.quantity += itemCount;
              notifyAnyListeners(currentPurchaseListNotifier);

              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPressedNo: () {
              final purchase =
                  PurchaseItemModel(itemId: item!.id!, quantity: itemCount);
              currentPurchaseListNotifier.value.add(purchase);
              notifyAnyListeners(currentPurchaseListNotifier);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          );
        } else {
          final purchase =
              PurchaseItemModel(itemId: item!.id!, quantity: itemCount);
          currentPurchaseListNotifier.value.add(purchase);
          notifyAnyListeners(currentPurchaseListNotifier);
          Navigator.of(context).pop();
        }
      }
      final sum = itemCount.toDouble() * itemPrice!;
      totalAmountNotifier.value += sum;
    }
  }

//Funtion for editing existing sale.
  void _saveForSaleEditable() {
    final itemCount = _itemStockController.text.parseInt();
    final itemPrice = _itemPriceController.text.parseDouble();

    //sale
    if (widget.saleModel != null && widget.isPurchase == false) {
      widget.saleModel!.itemCount = itemCount;
      widget.saleModel!.itemId = item!.id!;
      notifyAnyListeners(currentSaleItemNotifier);
    }

    //purchase
    else if (widget.purchaseItemModel != null && widget.isPurchase == true) {
      widget.purchaseItemModel!.itemId = item!.id!;
      widget.purchaseItemModel!.quantity = itemCount;
      notifyAnyListeners(currentPurchaseListNotifier);
    }
    final sum = itemCount.toDouble() * itemPrice!;
    totalAmountNotifier.value += sum;
    Navigator.of(context).pop();
  }
}
