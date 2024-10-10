import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/customer_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/functions/generate_unique_id.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/models/item_model.dart';

// ignore: constant_identifier_names
const _SALES_BOX = 'SalesBox';

//Opened a box for item so we can use it any time
late Box<SaleModel> _salesBox;

Future<void> getAllSalesFromDB() async {
  _salesBox = await Hive.openBox<SaleModel>(_SALES_BOX);
  // saleItemsListNotifier.value.clear();
  saleItemsListNotifier.value = _salesBox.values.toList();

  // _salesBox.clear();
  notifyAnyListeners(saleItemsListNotifier);
  print('The number of sales in the DB is ${_salesBox.values.length}');
}

Future<List<int>> addSalesToDB(List<SaleModel> sales) async {
  _salesBox = await Hive.openBox<SaleModel>(_SALES_BOX);
  List<int> salesIdList = [];
  for (var i = 0; i < sales.length; i++) {
    int id = generateUniqueId();
    sales[i].saleId = id;
    await _salesBox.put(id, sales[i]);
    salesIdList.add(id);
    print('The sale at id = $id is added to database');
  }
  getAllSalesFromDB();
  print('${sales.length} sales is added to database');

  return salesIdList;
}

SaleModel getSaleFromDB(int saleId) {
  final sale = saleItemsListNotifier.value.firstWhere((sale) {
    return sale.saleId == saleId;
  });
  return sale;
}

Future<void> deleteSaleFromDB(int saleId, int customerId) async {
  _salesBox = await Hive.openBox<SaleModel>(_SALES_BOX);
  await _salesBox.delete(saleId);
  final customer = getCustomerFromDB(customerId);
  customer.saleId.remove(saleId);
  await editCustomerSaleIdFromDB(customerId, customer.saleId);
  getAllSalesFromDB();
  log('Sale of id ' '$saleId' ' is deleted from the DB');
}

double getSumOfAllSaleOfOneCustomer(List<int> salesId) {
  double sum = 0;
  for (var id in salesId) {
    final sale = getSaleFromDB(id);
    final item = getItemFromDB(sale.itemId);
    sum += (item.itemPrice * sale.itemCount);
  }
  return sum;
}

Future<void> decreaseListOfStockFromDB(List<int> salesId) async {
  _salesBox = await Hive.openBox<SaleModel>(_SALES_BOX);

  for (var id in salesId) {
    final sale = getSaleFromDB(id);
    await decreaseOneItemStockFromDB(sale.itemId, sale.itemCount);
  }
  getAllItemFormDB();
  getAllSalesFromDB();
  print('Updating finished');
}

Future<void> increaseListOfStockFromDB(List<int> salesId) async {
  _salesBox = await Hive.openBox<SaleModel>(_SALES_BOX);

  for (var id in salesId) {
    final sale = getSaleFromDB(id);
    await increaseOneItemStockFromDB(sale.itemId, sale.itemCount);
  }
  getAllItemFormDB();
  getAllSalesFromDB();
  log('Stock increase finished');
}

void getTheNumberOfItemSold({DateTime? start, DateTime? end}) {
  numberOfItemSoldListNotifier.value = 0;
  final List<int> newSaleIdList = [];
  if (saleItemsListNotifier.value.isNotEmpty) {
    //get specific number of sale based on time.
    if (start != null) {
      final newCustomerList = customerListNotifier.value.where(
        (element) => (end == null)
            ? element.saleDateTime.isAfter(start)
            : element.saleDateTime.isAfter(start) &&
                element.saleDateTime.isBefore(end),
      );
      newSaleIdList.clear();
      for (var element in newCustomerList) {
        newSaleIdList.addAll(element.saleId);
      }
    }

    //get all the number of item sold
    else {
      newSaleIdList.clear();
      for (var element in customerListNotifier.value) {
        newSaleIdList.addAll(element.saleId);
      }
    }
    for (var sale in saleItemsListNotifier.value) {
      if (newSaleIdList.contains(sale.saleId)) {
        numberOfItemSoldListNotifier.value += sale.itemCount;
      }
    }
  }
  notifyAnyListeners(numberOfItemSoldListNotifier);
}

double getThePriceAmountOfItemSold({DateTime? start, DateTime? end}) {
  List<int> salesId = [];

  if (saleItemsListNotifier.value.isNotEmpty) {
    if (start != null) {
      final newCustomerList = customerListNotifier.value.where(
        (element) => (end == null)
            ? element.saleDateTime.isAfter(start)
            : element.saleDateTime.isAfter(start) &&
                element.saleDateTime.isBefore(end),
      );
      for (var element in newCustomerList) {
        salesId.addAll(element.saleId);
      }
    } else {
      for (var element in customerListNotifier.value) {
        salesId.addAll(element.saleId);
      }
    }
    priceAmountOfItemSoldListNotifier.value =
        getSumOfAllSaleOfOneCustomer(salesId);
  }
  // print('amount filter worked');
  notifyAnyListeners(priceAmountOfItemSoldListNotifier);
  return priceAmountOfItemSoldListNotifier.value;
}

void getSalesBasedOnDateTime({DateTime? startDate, DateTime? endDate}) {
  if (customerListNotifier.value.isNotEmpty) {
    if (startDate != null) {
      dateTimeFilterNotifier.value = customerListNotifier.value
          .where(
            (element) => endDate == null
                ? element.saleDateTime.isAfter(startDate)
                : element.saleDateTime.isAfter(startDate) &&
                    element.saleDateTime.isBefore(endDate),
          )
          .toList();
    } else {
      dateTimeFilterNotifier.value = customerListNotifier.value;
    }

    // print('date time filter is worked');
    notifyAnyListeners(dateTimeFilterNotifier);
  }
}

void getGraphBasedOnSales({required CurrentDate currentDate, DateTime? time}) {
  var start = getTheCurrentDateStartOrEnd(currentDate: currentDate, time: time);
  final end = getTheCurrentDateStartOrEnd(
      currentDate: currentDate, start: false, time: time);

  print('Start: $start\nEnd: $end');

  graphPointListNotifier.value.clear();
  // print(start.isBefore(end));
  for (start.day;
      start.isBefore(end);
      start = start.add(const Duration(days: 1))) {
    final sum = getTheSumOfOneDayAllCustomerSale(start);
    graphPointListNotifier.value.add(FlSpot(start.weekday.toDouble(), sum));

    // print('${start.day}');
  }

  notifyAnyListeners(graphPointListNotifier);
}

double getTheSumOfOneDayAllCustomerSale(DateTime date) {
  final customers = getOneDayFullCustomer(date);

  double sum = 0;
  for (var element in customers) {
    sum += getSumOfAllSaleOfOneCustomer(element.saleId);
  }
  return sum;
}
