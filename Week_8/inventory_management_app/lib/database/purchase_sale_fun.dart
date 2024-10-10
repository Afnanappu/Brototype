// ignore: constant_identifier_names
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/models/purchase_model.dart';

// ignore: constant_identifier_names
const String _PURCHASE_SALE_BOX = 'purchaseSaleBox';

late Box<PurchaseItemModel> _purchaseSaleBox;

Future<void> getAllPurchaseSaleFromDB() async {
  _purchaseSaleBox = await Hive.openBox<PurchaseItemModel>(_PURCHASE_SALE_BOX);
  purchasedItemListNotifier.value = _purchaseSaleBox.values.toList();
  // _purchaseSaleBox.clear();
  notifyAnyListeners(purchasedItemListNotifier);
  log('The number of sales in the DB is ${purchasedItemListNotifier.value.length}');
}

Future<List<int>> addPurchaseSaleToDB(List<PurchaseItemModel> purchase) async {
  _purchaseSaleBox = await Hive.openBox<PurchaseItemModel>(_PURCHASE_SALE_BOX);
  List<int> purchaseIdList = [];
  for (var i = 0; i < purchase.length; i++) {
    await _purchaseSaleBox.put(purchase[i].id, purchase[i]);
    purchaseIdList.add(purchase[i].id);
    // log('The purchase at id = ${purchase[i].id} is added to database');
  }
  getAllPurchaseSaleFromDB();
  log('${purchase.length} purchase is added to database is finished');

  return purchaseIdList;
}

PurchaseItemModel getOnePurchaseSaleFromDB(int id) {
  return purchasedItemListNotifier.value.firstWhere(
    (element) => element.id == id,
  );
}

List<PurchaseItemModel> getPurchaseSaleOfOnePurchase(List<int> purchaseSaleId) {
  List<PurchaseItemModel> list = [];
  for (var id in purchaseSaleId) {
    list.add(getOnePurchaseSaleFromDB(id));
  }
  return list;
  // purchasedItemListNotifier.value.where((element) => element.id == ,)
}
