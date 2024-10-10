import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/font_styles.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/models/item_model.dart';

ValueNotifier<bool> isSeeAllButtonPressedNotifier = ValueNotifier(false);

class BrandItemsForHome extends StatefulWidget {
  const BrandItemsForHome({super.key});

  @override
  State<BrandItemsForHome> createState() => _BrandItemsForHomeState();
}

int selectedButtonIndex = -1;

class _BrandItemsForHomeState extends State<BrandItemsForHome> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSeeAllButtonPressedNotifier,
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Brands
              const Text(
                'Brands',
                style: MyFontStyle.main,
              ),

              //See all
              //todo: Add the see all button functions
              TextButton(
                onPressed: () {
                  isSeeAllButtonPressedNotifier.value == false
                      ? isSeeAllButtonPressedNotifier.value = true
                      : isSeeAllButtonPressedNotifier.value = false;
                },
                child: Text(
                  value == false ? 'See all' : 'See less',
                  style: const TextStyle(color: MyColors.green),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyScreenSize.screenHeight5,
          ),
          SizedBox(
            height: (value == false) ? 45 : null,
            child: ValueListenableBuilder(
              valueListenable: itemBrandListNotifiers,
              builder: (context, brand, child) => (value == false)
                  ? ListView.builder(
                      //todo: Add the see all button functions
                      itemCount: brand.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, itemIndex) {
                        int index = itemIndex - 1;
                        if (itemIndex == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = index;
                                  filteredItemModelList.value =
                                      itemModelListNotifiers.value
                                          .map(
                                            (e) => e,
                                          )
                                          .toList();
                                });
                                notifyAnyListeners(filteredItemModelList);
                              },
                              style: ButtonStyle(
                                fixedSize: const WidgetStatePropertyAll(
                                    Size.fromHeight(45)),
                                foregroundColor:
                                    WidgetStateProperty.resolveWith(
                                  (states) {
                                    if (selectedButtonIndex == index) {
                                      return MyColors.white;
                                    }
                                    return MyColors.blackShade;
                                  },
                                ),
                                // minimumSize: WidgetStatePropertyAll(Size.zero),
                                shape: WidgetStateProperty.resolveWith<
                                    RoundedRectangleBorder>(
                                  (states) {
                                    if (selectedButtonIndex == index) {
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                          color: MyColors.green,
                                        ),
                                      );
                                    }
                                    return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color: MyColors.blackShade,
                                      ),
                                    );
                                  },
                                ),
                                backgroundColor:
                                    WidgetStateProperty.resolveWith(
                                  (Set<WidgetState> states) {
                                    if (selectedButtonIndex == index) {
                                      return MyColors.green;
                                    }
                                    return MyColors.white;
                                  },
                                ),
                              ),
                              child: const Text('All'),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = index;
                                  filteredItemModelList.value =
                                      itemModelListNotifiers.value
                                          .where((item) =>
                                              item.brandId == brand[index].id)
                                          .toList();
                                });
                                notifyAnyListeners(filteredItemModelList);
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    WidgetStateProperty.resolveWith(
                                  (states) {
                                    if (selectedButtonIndex == index) {
                                      return MyColors.white;
                                    }
                                    return MyColors.blackShade;
                                  },
                                ),
                                // minimumSize: WidgetStatePropertyAll(Size.zero),
                                shape: WidgetStateProperty.resolveWith<
                                    RoundedRectangleBorder>(
                                  (states) {
                                    if (selectedButtonIndex == index) {
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                          color: MyColors.green,
                                        ),
                                      );
                                    }
                                    return RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color: MyColors.blackShade,
                                      ),
                                    );
                                  },
                                ),
                                backgroundColor:
                                    WidgetStateProperty.resolveWith(
                                  (Set<WidgetState> states) {
                                    if (selectedButtonIndex == index) {
                                      return MyColors.green;
                                    }
                                    return MyColors.white;
                                  },
                                ),
                              ),
                              child: Text(brand[index].itemBrandName),
                            ),
                          );
                        }
                      },
                    )

                  //see all
                  : Wrap(
                      children: List.generate(
                        brand.length + 1,
                        (itemIndex) {
                          int index = itemIndex - 1;
                          if (itemIndex == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = index;
                                    filteredItemModelList.value =
                                        itemModelListNotifiers.value
                                            .map(
                                              (e) => e,
                                            )
                                            .toList();
                                  });
                                  notifyAnyListeners(filteredItemModelList);
                                },
                                style: ButtonStyle(
                                  fixedSize: const WidgetStatePropertyAll(
                                    Size.fromHeight(43),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith(
                                    (states) {
                                      if (selectedButtonIndex == index) {
                                        return MyColors.white;
                                      }
                                      return MyColors.blackShade;
                                    },
                                  ),
                                  // minimumSize: WidgetStatePropertyAll(Size.zero),
                                  shape: WidgetStateProperty.resolveWith<
                                      RoundedRectangleBorder>(
                                    (states) {
                                      if (selectedButtonIndex == index) {
                                        return RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: const BorderSide(
                                            color: MyColors.green,
                                          ),
                                        );
                                      }
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                          color: MyColors.blackShade,
                                        ),
                                      );
                                    },
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith(
                                    (Set<WidgetState> states) {
                                      if (selectedButtonIndex == index) {
                                        return MyColors.green;
                                      }
                                      return MyColors.white;
                                    },
                                  ),
                                ),
                                child: const Text('All'),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = index;
                                    filteredItemModelList.value =
                                        itemModelListNotifiers.value
                                            .where((item) =>
                                                item.brandId == brand[index].id)
                                            .toList();
                                  });
                                  notifyAnyListeners(filteredItemModelList);
                                },
                                style: ButtonStyle(
                                  fixedSize: const WidgetStatePropertyAll(
                                    Size.fromHeight(43),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith(
                                    (states) {
                                      if (selectedButtonIndex == index) {
                                        return MyColors.white;
                                      }
                                      return MyColors.blackShade;
                                    },
                                  ),
                                  // minimumSize: WidgetStatePropertyAll(Size.zero),
                                  shape: WidgetStateProperty.resolveWith<
                                      RoundedRectangleBorder>(
                                    (states) {
                                      if (selectedButtonIndex == index) {
                                        return RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: const BorderSide(
                                            color: MyColors.green,
                                          ),
                                        );
                                      }
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                          color: MyColors.blackShade,
                                        ),
                                      );
                                    },
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith(
                                    (Set<WidgetState> states) {
                                      if (selectedButtonIndex == index) {
                                        return MyColors.green;
                                      }
                                      return MyColors.white;
                                    },
                                  ),
                                ),
                                child: Text(brand[index].itemBrandName),
                              ),
                            );
                          }
                        },
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: MyScreenSize.screenHeight10,
          ),
        ],
      ),
    );
  }
}
