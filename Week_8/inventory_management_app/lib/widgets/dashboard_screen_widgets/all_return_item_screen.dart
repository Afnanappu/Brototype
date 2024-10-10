import 'package:flutter/material.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_sale_screen_widgets/return_list_tile.dart';

class AllReturnItemScreen extends StatelessWidget {
  const AllReturnItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "All returns",
          isAddIcon: false,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: returnItemsListNotifier,
        builder: (context, value, child) {
          return value.isNotEmpty
              ? ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final returnItem = value[index];
                    // final customer = getCustomerFromDB(returnItem.customerId);
                    // final saleItem = getSaleFromDB(returnItem.saleId);
                    final item = getItemFromDB(returnItem.itemId);
                    // final brand = getItemBrandFromDB(item.brandId);
                    return SaleListTile(
                      image: item.itemImage,
                      customerName: item.itemName,
                      invoiceNo: '${index + 1}',
                      brandName: returnItem.customerName,
                      itemPrice: '${item.itemPrice}',
                      saleAddDate: returnItem.dateTime, 
                      onTap: () {},
                    );
                  },
                )
              : const Center(
                child: Text('No Return item'),
              );
        },
      ),
    );
  }
}
