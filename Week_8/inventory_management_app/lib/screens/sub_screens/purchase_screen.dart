import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/purchase_sale_fun.dart';
import 'package:inventory_management_app/database/purchases_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/purchase_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_purchase.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/common/floating_action_button.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/sale_list_tile.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  Future<void> _loadPurchaseData() async {
    await getAllPurchasesFromDB();
    await getAllPurchaseSaleFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "Purchases",
          isAddIcon: false,
        ),
      ),
      body: FutureBuilder(
        future: _loadPurchaseData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ValueListenableBuilder(
              valueListenable: purchasedListNotifier,
              builder: (context, purchaseModelList, child) {
                //If there is no purchase
                if (purchasedListNotifier.value.isEmpty) {
                  return const Center(
                    child: Text('No purchase is added'),
                  );
                }

                //if purchase found
                else {
                  final purchaseModel = purchaseModelList.reversed.toList();
                  final length = purchaseModel.length;
                  return ListView.builder(
                    itemCount: length,
                    itemBuilder: (BuildContext context, int index) {
                      final purchase = purchaseModel[index];
                      final totalAmount =
                          findTheTotalAmountOfOnePurchase(purchase);

                      return CustomerListTile(
                        customerName: purchase.partyName,
                        invoiceNo: '${length - index}',
                        totalProduct: purchase.purchaseItemModleIdList.length,
                        itemPrice: formatMoney(number: totalAmount),
                        saleAddDate: purchase.dateTime,
                        isPurchase: true,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => AddNewPurchaseScreen(
                                    purchaseModel: purchase,
                                    isViewer: true,
                                    total: totalAmount,
                                  )),
                        ),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButtonForAll(
        text: 'Add Purchase',
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => const AddNewPurchaseScreen()),
        ),
        color: MyColors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
