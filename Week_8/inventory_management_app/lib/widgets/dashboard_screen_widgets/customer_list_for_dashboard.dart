import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/sale_list_tile.dart';

class CustomerListForDashboard extends StatelessWidget {
  const CustomerListForDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: customerListNotifier,
      builder: (BuildContext context, List<CustomerModel> customers, _) {
        return !kIsWeb
            ?

            //For Android
            SliverList.builder(
                itemCount: (customers.length < 4) ? customers.length : 4,
                itemBuilder: (context, index) {
                  final customerRev = customers.reversed.toList();
                  final customer = customerRev[index];
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
              )
            :

            //For Web
            ListView.builder(
                shrinkWrap: true,
                itemCount: (customers.length < 4) ? customers.length : 4,
                itemBuilder: (context, index) {
                  final customerRev = customers.reversed.toList();
                  final customer = customerRev[index];
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
