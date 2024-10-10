import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
 part 'item_model.g.dart';

ValueNotifier<List<ItemModel>> filteredItemModelList = ValueNotifier([]);
ValueNotifier<List<ItemBrandModel>> itemBrandListNotifiers = ValueNotifier([]);
ValueNotifier<List<ItemModel>> itemModelListNotifiers = ValueNotifier([]);
ValueNotifier<List<ItemModel>> itemFilterListNotifiers = ValueNotifier([]);
ValueNotifier<List<ItemModel>> outOfStockListNotifiers = ValueNotifier([]);
ValueNotifier<int> numberOfItemSoldListNotifier = ValueNotifier(0);
ValueNotifier<double> priceAmountOfItemSoldListNotifier = ValueNotifier(0);
ValueNotifier<List<FlSpot>> graphPointListNotifier = ValueNotifier([]);

@HiveType(typeId: 1)
class ItemBrandModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String itemBrandName;
  ItemBrandModel({this.id, required this.itemBrandName});
}

@HiveType(typeId: 2)
class ItemModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String itemName;

  @HiveField(2)
  int brandId;

  @HiveField(3)
  String itemImage;

  @HiveField(4)
  double itemPrice;

  @HiveField(5)
  List<String> color;

  @HiveField(6)
  List<String> ram;

  @HiveField(7)
  List<String> rom;

  @HiveField(8)
  String description;

  @HiveField(9)
  int stock;

  ItemModel({
    this.id,
    required this.brandId,
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    required this.color,
    required this.ram,
    required this.rom,
    required this.description,
    required this.stock,
  });
}




// class ItemStock {
//   int? id;
//   int stock;

//   ItemStock({required this.stock, this.id});
// }
