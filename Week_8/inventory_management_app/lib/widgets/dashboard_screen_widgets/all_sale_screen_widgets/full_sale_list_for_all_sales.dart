import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/sale_list_tile.dart';

class FullSaleListForAllSales extends StatelessWidget {
  const FullSaleListForAllSales({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dateTimeFilterNotifier,
      builder: (BuildContext context, List<CustomerModel> customers, _) {
        customers = customers.reversed.toList();
        return (dateTimeFilterNotifier.value.isEmpty)
            ? Container(
                width: double.infinity,
                height: MyScreenSize.screenHeight * .8,
                alignment: AlignmentDirectional.center,
                child: const Text('No sale is added'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  final sumOfSales =
                      getSumOfAllSaleOfOneCustomer(customer.saleId);
                  return CustomerListTile(
                    customerName: customer.customerName,
                    invoiceNo: '${customers.length - index}',
                    totalProduct: customer.saleId.length,
                    itemPrice: formatMoney(number: sumOfSales),
                    saleAddDate: customer.saleDateTime,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SaleAddNew(
                            customer: customer,
                            isViewer: true,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
      },
    );
  }
}
