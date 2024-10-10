import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';

// ignore: must_be_immutable
class SaleListTile extends StatelessWidget {
  final String image;
  final String customerName;
  final String invoiceNo;
  final String brandName;
  final String itemPrice;
  final DateTime saleAddDate;
  final void Function()? onTap;
  SaleListTile({
    super.key,
    required this.image,
    required this.customerName,
    required this.invoiceNo,
    required this.brandName,
    required this.itemPrice,
    required this.saleAddDate,
    required this.onTap,
  });
  ValueNotifier<bool> isSaleNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: !kIsWeb
              ? Image.file(
                  File(image),
                  fit: BoxFit.contain,
                )
              : Image.memory(base64Decode(image)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  customerName,
                  overflow: TextOverflow.ellipsis,
                  style: MyFontStyle.saleTile,
                
                ),
              ),
              Text(
                '#$invoiceNo',
                style: MyFontStyle.saleTileInvoice,
              ),
            ],
          ),
          subtitle: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    brandName,
                    style: const TextStyle(
                        color: MyColors.darkGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    formatDateTime(date: saleAddDate),
                    style: MyFontStyle.saleTileInvoice,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemPrice,
                    style: MyFontStyle.saleTile,
                  ),
                  ValueListenableBuilder(
                    valueListenable: isSaleNotifier,
                    builder: (context, value, child) => MyCustomButton(
                        color: value == true
                            ? const Color.fromARGB(146, 154, 255, 170)
                            : const Color.fromARGB(146, 255, 154, 154),
                        text: value == true ? 'SALE' : 'RETURNED',
                        isSale: isSaleNotifier.value,
                        onTap: () {}
                        // customAlertBox(
                        //   content: 'Are you sure?',
                        //   context: context,
                        //   title: value == true ? 'Return item' : 'Change to sale',
                        //   //todo: add return function
                        //   onPressedYes: () {
                        //     isSaleNotifier.value == true
                        //         ? isSaleNotifier.value = false
                        //         : isSaleNotifier.value = true;
                        //     print('Item is ${isSaleNotifier.value}');
                        //     Navigator.of(context).pop();
                        //   },
                        // ),
                        ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
