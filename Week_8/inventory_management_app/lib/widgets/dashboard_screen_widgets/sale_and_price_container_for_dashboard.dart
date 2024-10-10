import 'package:flutter/cupertino.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/common/custom_container.dart';

class SaleAndPriceContainerForDashboard extends StatelessWidget {
  const SaleAndPriceContainerForDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 600
          ?  Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Sold item
                ValueListenableBuilder(
                  valueListenable: numberOfItemSoldListNotifier,
                  builder: (context, value, child) => CustomContainer(
                    title: 'No. of Item sold',
                    subtitle: value.toString(),
                    haveBgColor: false,
                  ),
                ),
          
                //Total sale
                ValueListenableBuilder(
                  valueListenable: priceAmountOfItemSoldListNotifier,
                  builder: (context, value, child) => CustomContainer(
                    title: 'Total sale',
                    subtitle:
                        formatMoney(number: value, haveEndSymbol: true),
                  ),
                ),
              ],
            ),
          )
          : Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
                children: [
                  //Sold item
                  ValueListenableBuilder(
                    valueListenable: numberOfItemSoldListNotifier,
                    builder: (context, value, child) => CustomContainer(
                      height: 170,
                      width: MyScreenSize.screenWidth * 0.2,
                      title: 'No. of Item sold',
                      subtitle: value.toString(),
                      haveBgColor: false,
                    ),
                  ),
            
                  const SizedBox(height: 20,),
                  //Total sale
                  ValueListenableBuilder(
                    valueListenable: priceAmountOfItemSoldListNotifier,
                    builder: (context, value, child) => CustomContainer(
                      height: 170,
                      width: MyScreenSize.screenWidth * 0.2,
                      title: 'Total sale',
                      subtitle: formatMoney(number: value, haveEndSymbol: true),
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
