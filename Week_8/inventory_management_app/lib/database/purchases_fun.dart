import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/database/purchase_sale_fun.dart';
import 'package:inventory_management_app/models/purchase_model.dart';

// ignore: constant_identifier_names
const String _PURCHASE_BOX = 'purchaseBox';

late Box<PurchaseModel> _purchaseBox;

Future<void> getAllPurchasesFromDB() async {
  _purchaseBox = await Hive.openBox<PurchaseModel>(_PURCHASE_BOX);
  purchasedListNotifier.value = _purchaseBox.values.toList();
  // _purchaseBox.clear();
  notifyAnyListeners(purchasedItemListNotifier);
  log('fetching all the purchase from DB and the length is ${purchasedListNotifier.value.length}');
}

Future<void> addPurchaseToDB(PurchaseModel purchase) async {
  _purchaseBox = await Hive.openBox<PurchaseModel>(_PURCHASE_BOX);

  await _purchaseBox.put(purchase.id, purchase);
  log('ONE purchase is added to DB and the name of the party is ${purchase.partyName}');
  await getAllPurchasesFromDB();
}

Future<PurchaseModel?> getOnePurchaseFromDB(int id) async {
  _purchaseBox = await Hive.openBox<PurchaseModel>(_PURCHASE_BOX);
  return _purchaseBox.get(id);
}

double findTheTotalAmountOfOnePurchase(PurchaseModel purchase) {
  double sum = 0;

  for (var purchaseSaleId in purchase.purchaseItemModleIdList) {
    final purchaseSale = getOnePurchaseSaleFromDB(purchaseSaleId);
    final item = getItemFromDB(purchaseSale.itemId);
    sum += (item.itemPrice * purchaseSale.quantity);
    // log("purchaseSaleId");
  }

  return sum;
}
