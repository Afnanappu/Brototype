import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/item_full_details_screen.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_sale_screen_widgets/return_list_tile.dart';

class ReturnSaleListForDashboard extends StatelessWidget {
  const ReturnSaleListForDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? ValueListenableBuilder(
            valueListenable: returnItemsListNotifier,
            builder: (context, value, child) {
              final reversedReturnSales = value.reversed.toList();
              final len = value.length;
              return value.isNotEmpty
                  ? SliverList.builder(
                      itemCount: (len < 4) ? len : 4,
                      itemBuilder: (context, index) {
                        final returnItem = reversedReturnSales[index];
                        final item = getItemFromDB(returnItem.itemId);
                        return SaleListTile(
                          image: item.itemImage,
                          customerName: item.itemName,
                          invoiceNo: '${len - index}',
                          brandName: returnItem.customerName,
                          itemPrice: '${item.itemPrice}',
                          saleAddDate: returnItem.dateTime,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ItemFullDetails(
                                    itemModel: item, brandId: item.brandId),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text('No Return item'),
                      ),
                    );
            },
          )
        :
        //For Web
        ValueListenableBuilder(
            valueListenable: returnItemsListNotifier,
            builder: (context, value, child) {
              final reversedReturnSales = value.reversed.toList();
              final len = value.length;
              return value.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: (len < 4) ? len : 4,
                      itemBuilder: (context, index) {
                        final returnItem = reversedReturnSales[index];
                        final item = getItemFromDB(returnItem.itemId);
                        return SaleListTile(
                          image: item.itemImage,
                          customerName: item.itemName,
                          invoiceNo: '${len - index}',
                          brandName: returnItem.customerName,
                          itemPrice: '${item.itemPrice}',
                          saleAddDate: returnItem.dateTime,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ItemFullDetails(
                                    itemModel: item, brandId: item.brandId),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text('No Return item'),
                    );
            },
          );
  }
}
