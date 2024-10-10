// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/customer_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/database/purchase_sale_fun.dart';
import 'package:inventory_management_app/database/purchases_fun.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/models/purchase_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_purchase.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/widgets/common/snack_bar_messenger.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/button_add_sale.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/sale_add_item_screen_widgets/success_animation_screen.dart';

class ButtonsForAddNewSaleScreen extends StatelessWidget {
  const ButtonsForAddNewSaleScreen({
    super.key,
    this.isPurchase = false,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController phoneController,
    required this.selectedDate,
    required this.mounted,
    this.saleWidget,
    this.purchaseWidget,
  })  : _formKey = formKey,
        _nameController = nameController,
        _phoneController = phoneController;

  final SaleAddNew? saleWidget;
  final AddNewPurchaseScreen? purchaseWidget;
  final bool isPurchase;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _phoneController;
  final DateTime selectedDate;

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 85,
      color: MyColors.white,
      child: ((saleWidget != null && saleWidget!.isViewer == false) ||
              (purchaseWidget != null && purchaseWidget!.isViewer == false))
          ? Row(
              children: [
                Expanded(
                  child: buttonAddSale(
                    text: 'Save&New',
                    haveBorder: true,
                    btnColor: MyColors.transparent,
                    onTap: () => _saveAndNewForSale(context),
                  ),
                ),

                //Save
                Expanded(
                  child: buttonAddSale(
                    text: 'Save',
                    onTap: () => _saveForSale(context),
                  ),
                ),
              ],
            )
          : buttonAddSale(
              text: 'Ok',
              onTap: () async {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  void _saveAndNewForSale(BuildContext context) async {
    if (_formKey.currentState!.validate() &&
            (isPurchase == false && currentSaleItemNotifier.value.isNotEmpty) ||
        (isPurchase == true && currentPurchaseListNotifier.value.isNotEmpty)) {
      //for purchase
      if (isPurchase == true) {
        final purchasesList = currentPurchaseListNotifier.value;

        final listOfPurcaseSaleId = await addPurchaseSaleToDB(purchasesList);

        final purchase = PurchaseModel(
          partyName: _nameController.text,
          phone: _phoneController.text,
          dateTime: DateTime.now(),
          purchaseItemModleIdList: listOfPurcaseSaleId,
        );

        await addPurchaseToDB(purchase);

        for (var id in purchase.purchaseItemModleIdList) {
          final purch = getOnePurchaseSaleFromDB(id);

          await increaseOneItemStockFromDB(purch.itemId, purch.quantity);
        }
        currentPurchaseListNotifier.value.clear();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AddNewPurchaseScreen(),
          ),
        );
      }

      //for sale
      else {
        final sales = currentSaleItemNotifier.value;

        final salesIdList = await addSalesToDB(sales);

        final customer = CustomerModel(
          customerName: _nameController.text,
          customerPhone: _phoneController.text,
          saleId: salesIdList,
          saleDateTime: selectedDate,
        );

        await addCustomerToDB(customer);

        await decreaseListOfStockFromDB(salesIdList);

        currentSaleItemNotifier.value.clear();
        notifyAnyListeners(currentSaleItemNotifier);

        if (mounted) {
          CustomSnackBarMessage(
            context: context,
            message: 'Sale is added successfully',
            color: MyColors.green,
            duration: 2,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const SaleAddNew(),
            ),
          );
        }
      }
    } else if ((isPurchase == false && currentSaleItemNotifier.value.isEmpty) ||
        (isPurchase == true && currentPurchaseListNotifier.value.isEmpty)) {
      CustomSnackBarMessage(
        context: context,
        message: 'Add an item to save',
        color: Colors.red,
      );
    }
  }

  void _saveForSale(BuildContext context) async {
    if (_formKey.currentState!.validate() &&
            (isPurchase == false && currentSaleItemNotifier.value.isNotEmpty) ||
        (isPurchase == true && currentPurchaseListNotifier.value.isNotEmpty)) {
      //for purchase
      if (isPurchase == true) {
        final purchasesList = currentPurchaseListNotifier.value;

        final listOfPurcaseSaleId = await addPurchaseSaleToDB(purchasesList);

        final purchase = PurchaseModel(
          partyName: _nameController.text,
          phone: _phoneController.text,
          dateTime: DateTime.now(),
          purchaseItemModleIdList: listOfPurcaseSaleId,
        );
        await addPurchaseToDB(purchase);

        for (var id in purchase.purchaseItemModleIdList) {
          final purch = getOnePurchaseSaleFromDB(id);
          // final item = getItemFromDB(purch.itemId);
          await increaseOneItemStockFromDB(purch.itemId, purch.quantity);
        }

        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => const SuccessAnimationScreen()));
      }

      //for sale
      else {
        final sales = currentSaleItemNotifier.value;

        final salesIdList = await addSalesToDB(sales);

        final customer = CustomerModel(
          customerName: _nameController.text,
          customerPhone: _phoneController.text,
          saleId: salesIdList,
          saleDateTime: selectedDate,
        );

        await addCustomerToDB(customer);

        await decreaseListOfStockFromDB(salesIdList);

        getTheNumberOfItemSold(
            start: DateTime.now()
                .subtract(Duration(days: DateTime.now().weekday - 1)));

        getThePriceAmountOfItemSold(
            start: DateTime.now()
                .subtract(Duration(days: DateTime.now().weekday - 1)));

        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => const SuccessAnimationScreen()));
      }
    } else {
      CustomSnackBarMessage(
        context: context,
        message: 'No item is selected, please select an item',
        color: Colors.red,
      );
    }
  }
}
