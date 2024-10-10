import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/item_fun.dart';
import 'package:inventory_management_app/functions/format_money.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/brand_items.dart';
import 'package:inventory_management_app/screens/sub_screens/item_full_details_screen.dart';

class ItemDetailsForHome extends StatefulWidget {
  const ItemDetailsForHome({super.key});

  @override
  State<ItemDetailsForHome> createState() => _ItemDetailsForHomeState();
}

class _ItemDetailsForHomeState extends State<ItemDetailsForHome> {
  int _getTheCurrentSupportedGridLength() {
    int len = MyScreenSize.screenWidth ~/ 213;
    log('The max grid length ==  $len');
    return len;
  }

  // double _getTheCurrectSpacingForGrid() {
  //   double space =
  //       MyScreenSize.screenWidth / (_getTheCurrentSupportedGridLength() + 1);
  //   log('The Currect spacing for grid ==  $space');
  //   return space;
  // }

  Future<void> _fetchData() async {
    await getAllItemFormDB();
    filteredItemModelList.value = itemModelListNotifiers.value
        .map(
          (e) => e,
        )
        .toList();
    selectedButtonIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: MyScreenSize.screenHeight * .4,
                alignment: AlignmentDirectional.center,
                child: const CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: MyScreenSize.screenHeight * .4,
                alignment: AlignmentDirectional.center,
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            return ValueListenableBuilder(
              valueListenable: filteredItemModelList,
              builder: (BuildContext context, List<ItemModel> itemModelList,
                      _) =>
                  (filteredItemModelList.value.isEmpty)
                      ? SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            height: MyScreenSize.screenHeight * .4,
                            alignment: AlignmentDirectional.center,
                            child: const Text('No item found'),
                          ),
                        )
                      : SliverPadding(
                          padding: EdgeInsets.only(
                              bottom: MyScreenSize.screenHeight * 0.1),
                          sliver: SliverGrid.builder(
                            itemCount: itemModelList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: !kIsWeb
                                  ? 2
                                  : _getTheCurrentSupportedGridLength(),
                              crossAxisSpacing: kIsWeb ? 15 : 0,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final itemModel = itemModelList[index];
                              return Center(
                                child: GridTile(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ItemFullDetails(
                                            itemModel: itemModel,
                                            brandId: itemModel.brandId,
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        height: 125,
                                        width: kIsWeb
                                            ? 213
                                            : MyScreenSize.screenWidth * 0.37,
                                        decoration: BoxDecoration(
                                          color: MyColors.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(13),
                                          child: !kIsWeb
                                              ? Image.file(
                                                  File(itemModel.itemImage),
                                                  fit: BoxFit.contain,
                                                )
                                              : Image.memory(base64Decode(
                                                  itemModel.itemImage)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        itemModel.itemName,
                                        style: MyFontStyle.itemNameInMain,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      formatMoney(number: itemModel.itemPrice),
                                      style: MyFontStyle.itemPriceInMain,
                                    ),
                                  ],
                                )),
                              );
                            },
                          ),
                        ),
            );
          }
        });
  }
}
