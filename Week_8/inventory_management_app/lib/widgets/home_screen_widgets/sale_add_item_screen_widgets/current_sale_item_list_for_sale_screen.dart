import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/database/return_fun.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_item_in_sale.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/widgets/common/alert_dialog.dart';
import 'package:inventory_management_app/widgets/common/buttons.dart';

class CurrentSaleItemListForSaleScreen extends StatelessWidget {
  const CurrentSaleItemListForSaleScreen({
    super.key,
    required this.widget,
  });

  final SaleAddNew widget;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentSaleItemNotifier,
      builder: (context, saleItem, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: saleItem.length,
          itemBuilder: (context, index) {
            final item = getItemFromDB(saleItem[index].itemId);
            final sale = saleItem[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  ListTile(
                    onTap: () => widget.isViewer == false ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewItemInSale(
                        itemModel: item,
                        saleModel: sale,
                        isEditable: true,
                        
                      ),
                    )): null,
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
                          formatMoney(number: item.itemPrice * sale.itemCount),
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
                            const Text('Subtotal'),
                            Text(
                                '${sale.itemCount} x ${formatMoney(number: item.itemPrice, haveSymbol: false)} = ${formatMoney(number: item.itemPrice * sale.itemCount)}'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (widget.isViewer == true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyCustomButton(
                                color: MyColors.red,
                                haveBgColor: false,
                                text: 'RETURN',
                                isSale: false,
                                onTap: () => customAlertBox(
                                  content: 'Are you sure?',

                                  context: context,
                                  title: 'Return item',

                                  //todo: add return function
                                  onPressedYes: () async {
                                    final ReturnSaleModel returnItem =
                                        ReturnSaleModel(
                                      customerName:
                                          widget.customer!.customerName,
                                      itemId: item.id!,
                                      quantity: sale.itemCount,
                                      dateTime: DateTime.now(),
                                    );

                                    await addReturnItemToDB(returnItem);

                                    //delete sale from details screen and from db
                                    await deleteSaleFromDB(sale.saleId!,
                                        widget.customer!.customerId!);

                                    currentSaleItemNotifier.value.remove(sale);

                                    await getAllReturnedItemFromDb();

                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pop();
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (!widget.isViewer)
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
                                      final sale = currentSaleItemNotifier.value
                                          .removeAt(index);

                                      final item = getItemFromDB(sale.itemId);

                                      totalAmountNotifier.value =
                                          totalAmountNotifier.value -
                                              (item.itemPrice * sale.itemCount);

                                      notifyAnyListeners(
                                        currentSaleItemNotifier,
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
