// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/functions/generate_unique_id.dart';
part 'purchase_model.g.dart';

ValueNotifier<List<PurchaseModel>> purchasedListNotifier = ValueNotifier([]);
ValueNotifier<List<PurchaseItemModel>> purchasedItemListNotifier =
    ValueNotifier([]);

@HiveType(typeId: 6)
class PurchaseModel {
  @HiveField(0)
  int id = generateUniqueId();

  @HiveField(1)
  String partyName;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  List<int> purchaseItemModleIdList;

  @HiveField(4)
  DateTime dateTime;

  PurchaseModel({
    int? id,
    required this.partyName,
    this.phone,
    required this.purchaseItemModleIdList,
    required this.dateTime,
  }) {
    if (id != null) {
      this.id = id;
    }
    if (partyName.isEmpty) {
      throw ArgumentError('Party name cannot be empty');
    }
    if (purchaseItemModleIdList.isEmpty) {
      throw ArgumentError('There should be at least one item in the purchase');
    }
  }
}

@HiveType(typeId: 7)
class PurchaseItemModel {
  @HiveField(0)
  int id = generateUniqueId();

  @HiveField(1)
  int itemId;

  @HiveField(2)
  int quantity;

  PurchaseItemModel({int? id, required this.itemId, required this.quantity}) {
    if (id != null) {
      this.id = id;
    }
  }
}
