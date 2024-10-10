// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';

// ignore: must_be_immutable
class CustomerListTile extends StatelessWidget {
  final String customerName;
  final String invoiceNo;
  final int totalProduct;
  final String itemPrice;
  final DateTime saleAddDate;
  final void Function()? onTap;
  final bool isPurchase;
  CustomerListTile({
    super.key,
    required this.customerName,
    required this.invoiceNo,
    required this.totalProduct,
    required this.itemPrice,
    required this.saleAddDate,
    required this.onTap,
    this.isPurchase = false,
  });
  ValueNotifier<bool> isSaleNotifier = ValueNotifier(true);

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name: $customerName',
                style: const TextStyle(
                  color: MyColors.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
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
                    'No. of products: $totalProduct',
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
                    'Total: $itemPrice',
                    style: const TextStyle(
                      color: MyColors.dark,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  (isPurchase == false)
                      ? ValueListenableBuilder(
                          valueListenable: isSaleNotifier,
                          builder: (context, value, child) => MyCustomButton(
                              color: value == true
                                  ? const Color.fromARGB(146, 154, 255, 170)
                                  : const Color.fromARGB(146, 255, 154, 154),
                              text: value == true ? 'SALE' : 'RETURNED',
                              isSale: isSaleNotifier.value,
                              onTap: () {}
                              ),
                        )
                      : MyCustomButton(
                          color: Colors.blue[100]!,
                          text: 'PURCHASED',
                          textColor: Colors.blue,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
