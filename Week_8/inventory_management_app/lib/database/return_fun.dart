import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/generate_unique_id.dart';
import 'package:inventory_management_app/models/customer_model.dart';

// ignore: constant_identifier_names
const _RETURN_BOX = 'ReturnBox';

late Box<ReturnSaleModel> _returnBox;

Future<void> getAllReturnedItemFromDb() async {
  _returnBox = await Hive.openBox<ReturnSaleModel>(_RETURN_BOX);
  returnItemsListNotifier.value = _returnBox.values.toList();
  // _returnBox.clear();
  notifyAnyListeners(returnItemsListNotifier);
  log('fetching all return sale item from db and the length is ${returnItemsListNotifier.value.length}');
}

Future<void> addReturnItemToDB(ReturnSaleModel returnItem) async {
  _returnBox = await Hive.openBox<ReturnSaleModel>(_RETURN_BOX);
  final key = generateUniqueId();
  returnItem.id = key;
  await _returnBox.put(key, returnItem);

  await increaseOneItemStockFromDB(returnItem.itemId, returnItem.quantity);
  log('Returned item is added to DB and item count in increased');
}

// Future<void> deleteReturnSaleFromDB(int? returnId) async {
//   _returnBox = await Hive.openBox<ReturnSaleModel>(_RETURN_BOX);

//   if (returnId != null) {
//     await _returnBox.delete(returnId);
//     log('Returned sale at id = $returnId is deleted from db');
//   }else{

//   }
// }
