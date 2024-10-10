import 'package:flutter/widgets.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/common/custom_container.dart';

class SalesAndPriceContainerForAllSale extends StatelessWidget {
  const SalesAndPriceContainerForAllSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 600
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //item box
                    ValueListenableBuilder(
                        valueListenable: numberOfItemSoldListNotifier,
                        builder: (context, value, child) => CustomContainer(
                              haveBgColor: false,
                              title: 'No. of item sold',
                              subtitle: '$value',
                              height: MyScreenSize.screenWidth * 0.3,
                            )),

                    //sale box
                    ValueListenableBuilder(
                      valueListenable: priceAmountOfItemSoldListNotifier,
                      builder: (context, value, child) => CustomContainer(
                        title: 'Total sale',
                        height: MyScreenSize.screenWidth * 0.3,
                        subtitle: formatMoney(
                          number: value,
                          haveEndSymbol: true,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    //item box
                    ValueListenableBuilder(
                        valueListenable: numberOfItemSoldListNotifier,
                        builder: (context, value, child) => CustomContainer(
                              height: 170,
                              width: MyScreenSize.screenWidth * 0.2,
                              haveBgColor: false,
                              title: 'No. of item sold',
                              subtitle: '$value',
                            ),),
                    const SizedBox(height: 15,),
                    //sale box
                    ValueListenableBuilder(
                      valueListenable: priceAmountOfItemSoldListNotifier,
                      builder: (context, value, child) => CustomContainer(
                        height: 170,
                        width: MyScreenSize.screenWidth * 0.2,
                        title: 'Total sale',
                        subtitle: formatMoney(
                          number: value,
                          haveEndSymbol: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),);
  }
}
