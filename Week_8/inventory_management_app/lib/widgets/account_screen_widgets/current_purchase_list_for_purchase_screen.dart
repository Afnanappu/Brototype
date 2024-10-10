import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/purchase_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_item_in_sale.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_purchase.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';

class CurretenPurchaseListForPurchaseAddScreen extends StatelessWidget {
  const CurretenPurchaseListForPurchaseAddScreen({
    super.key,
    this.isViewer = false,
  });
  final bool isViewer;
  // final String itemName;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPurchaseListNotifier,
      builder:
          (BuildContext context, List<PurchaseItemModel> value, Widget? child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.length,
          itemBuilder: (context, index) {
            final purchase = value[index];
            final item = getItemFromDB(purchase.itemId);
            // final brand = getItemBrandFromDB(item.brandId);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  ListTile(
                    onTap: () => isViewer == false
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddNewItemInSale(
                                isPurchase: true,
                                itemModel: item,
                                purchaseItemModel: purchase,
                                isEditable: true,
                              ),
                            ),
                          )
                        : null,
                    tileColor: const Color.fromARGB(255, 243, 255, 227),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.itemName,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                color: MyColors.blackShade,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          formatMoney(
                              number: item.itemPrice * purchase.quantity),
                          style: const TextStyle(
                              color: MyColors.blackShade,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text('Subtotal'),
                            ),
                            !kIsWeb?
                            Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${purchase.quantity} x ${formatMoney(number: item.itemPrice, haveSymbol: false)} = ${formatMoney(number: item.itemPrice * purchase.quantity)}',
                                ),
                              ),
                            ):SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${purchase.quantity} x ${formatMoney(number: item.itemPrice, haveSymbol: false)} = ${formatMoney(number: item.itemPrice * purchase.quantity)}',
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  if (isViewer == false)
                    FractionalTranslation(
                      translation: const Offset(0.06, -0.45),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Remove selected item'),
                                content: const Text('Are you sure?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      final purchaseItem =
                                          currentPurchaseListNotifier.value
                                              .removeAt(index);

                                      // final item = getItemFromDB(purchaseItem.itemId);

                                      totalAmountNotifier.value =
                                          totalAmountNotifier.value -
                                              (item.itemPrice *
                                                  purchaseItem.quantity);

                                      notifyAnyListeners(
                                        currentPurchaseListNotifier,
                                      );

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
