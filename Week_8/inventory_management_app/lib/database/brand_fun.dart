import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/functions/generate_unique_id.dart';
import 'package:inventory_management_app/models/item_model.dart';

//Name of the DB
// ignore: constant_identifier_names
const _BRAND_BOX = 'BrandBox';

//Opened a box so we can use it any time.
late Box<ItemBrandModel> _brandBox;

//Function to get all item brand from database and added to itemBrandListNotifiers.
Future<void> getAllItemBrandFromDB() async {
  _brandBox = await Hive.openBox<ItemBrandModel>(_BRAND_BOX);
  itemBrandListNotifiers.value =
      _brandBox.values.cast<ItemBrandModel>().toList();
  // _brandBox.clear();
  notifyAnyListeners(itemBrandListNotifiers);
  // print(
  //     'fetching all brands from database\nThe number of brand in the DB is ${_brandBox.values.length}');
}

//Function to add brand to database
Future<void> addBrandToDB(ItemBrandModel brand) async {
  _brandBox = await Hive.openBox<ItemBrandModel>(_BRAND_BOX);
  //todo:put unique id
  brand.id = generateUniqueId();

  await _brandBox.put(brand.id, brand);
  getAllItemBrandFromDB();
  // print(
  //     'A new brand is added to database and the brand id = ${brand.id} and the length of all brand is ${_brandBox.values.length}');
}

//Function to delete brand from database.
Future<void> deleteBrandFromDB(int brandId) async {
  _brandBox = await Hive.openBox<ItemBrandModel>(_BRAND_BOX);

  await _brandBox.delete(brandId);
  getAllItemBrandFromDB();
  // print(
  //     'The brand in the index $brandId is deleted. The available brands is ${_brandBox.values.length}');
}

//Function to Edit brand from database.
Future<void> editBrandFromDB(
  int brandId,
  ItemBrandModel brand,
) async {
  _brandBox = await Hive.openBox<ItemBrandModel>(_BRAND_BOX);
  _brandBox.put(brandId, brand);
  getAllItemBrandFromDB();
  // print('The brand at index $brandId is edited');
}


ItemBrandModel getItemBrandFromDB(int brandId) {
  final brand = itemBrandListNotifiers.value.firstWhere(
    (brand) => brand.id == brandId,
  );
  return brand;
}

//Created a function that can notify any listeners.
void notifyAnyListeners(ValueNotifier notifier) {
  notifier.notifyListeners();
}