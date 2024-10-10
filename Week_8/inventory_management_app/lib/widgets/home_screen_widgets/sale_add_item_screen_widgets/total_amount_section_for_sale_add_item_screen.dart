import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_purchase.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';

enum SaleType { sales, purchase }

class TotalAmountSectionForSaleAddItemScreen extends StatelessWidget {
  const TotalAmountSectionForSaleAddItemScreen({
    super.key,
    this.total,
    required this.type,
  });
  final double? total;
  final SaleType type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total Amount',
          style: TextStyle(
              color: MyColors.blackShade,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),

        //total amount price
        Container(
          constraints: const BoxConstraints(maxWidth: 180, minWidth: 100),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: MyColors.blackShade, style: BorderStyle.solid))),
          child: ListTile(
            leading: const Text('₹',
                style: TextStyle(
                    color: MyColors.blackShade,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            title: ValueListenableBuilder(
              valueListenable: totalAmountNotifier,
              builder: (context, value, child) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      formatMoney(
                        number: total != null ? total! : _findTotalAmound(type),
                        haveSymbol: false,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: MyColors.blackShade,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

double _findTotalAmound(SaleType type) {
  log('finding total amount of $type');
  switch (type) {
    case SaleType.sales:
      double sum = 0;
      for (var sale in currentSaleItemNotifier.value) {
        final item = getItemFromDB(sale.itemId);
        sum += sale.itemCount * item.itemPrice;
      }
      return sum;
    case SaleType.purchase:
      double sum = 0;
      for (var purchase in currentPurchaseListNotifier.value) {
        final item = getItemFromDB(purchase.itemId);
        sum += purchase.quantity * item.itemPrice;
      }
      return sum;
    default:
      0;
  }
  return 0;
}
