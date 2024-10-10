import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/functions/generate_unique_id.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/models/item_model.dart';

// ignore: constant_identifier_names
const _CUSTOMER_BOX = 'CustomerBox';

//Opened a box for item so we can use it any time
late Box<CustomerModel> _customerBox;

Future<void> getAllCustomersFormDB() async {
  _customerBox = await Hive.openBox<CustomerModel>(_CUSTOMER_BOX);
  customerListNotifier.value.clear();
  customerListNotifier.value =
      _customerBox.values.cast<CustomerModel>().toList();
  // _customerBox.clear();
  notifyAnyListeners(customerListNotifier);
  print(
      'fetching all customers from database\nThe number of customer in the DB is ${_customerBox.values.length}');
}

Future<void> addCustomerToDB(CustomerModel customer) async {
  _customerBox = await Hive.openBox<CustomerModel>(_CUSTOMER_BOX);

  int id = generateUniqueId();
  customer.customerId = id;
  await _customerBox.put(id, customer);
  print(
      'A new customer is added to database and the customer id = $id and the length of all customer is ${_customerBox.values.length}');
  for (var val in _customerBox.values) {
    print(val.customerName);
  }
  getAllCustomersFormDB();
}

Future<void> editCustomerSaleIdFromDB(int customerId, List<int> salesId) async {
  _customerBox = await Hive.openBox<CustomerModel>(_CUSTOMER_BOX);
  final customer = _customerBox.values.firstWhere(
    (element) => element.customerId == customerId,
  );
  final newCustomer = CustomerModel(
    customerId: customerId,
    customerName: customer.customerName,
    customerPhone: customer.customerPhone,
    saleDateTime: customer.saleDateTime,
    saleId: salesId,
  );

  await _customerBox.put(customerId, newCustomer);
  await getAllCustomersFormDB();
  log('Customer sale list is edited');
}

Future<void> deleteCustomerFromDB(int customerId) async {
  _customerBox = await Hive.openBox<CustomerModel>(_CUSTOMER_BOX);
  await _customerBox.delete(customerId);
  await getAllCustomersFormDB();
  getTheCurrentDate(CurrentDate.week);
  notifyAnyListeners(priceAmountOfItemSoldListNotifier);
  print(
      'The customer in the id = $customerId is deleted and the length of all customers is ${_customerBox.values.length}');
}

CustomerModel getCustomerFromDB(int customerId) {
  return customerListNotifier.value.firstWhere(
    (element) => element.customerId == customerId,
  );
}

List<CustomerModel> getOneDayFullCustomer(DateTime date) {
  return dateTimeFilterNotifier.value
      .where(
        (element) =>
            DateTime(element.saleDateTime.year, element.saleDateTime.month,
                element.saleDateTime.day) ==
            DateTime(date.year, date.month, date.day),
      )
      .toList();
}

// Future<void> deleteSaleFromCustomerByItemId(int itemId) async {
//   _customerBox = await Hive.openBox(_CUSTOMER_BOX);
//   for (var element in _customerBox.values) {
//     for (var saleId in element.saleId) {
//       final sale = getSaleFromFromDB(saleId);
//       if (sale.itemId == itemId) {
//         deleteItemFromDB(itemId);
//         print(
//             'Item $itemId is deleted from the sales because the item is deleted from the db');
//       }
//     }
//   }
//   notifyAnyListeners(saleItemsListNotifier);
//   notifyAnyListeners(customerListNotifier);
// }
