import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/customer_fun.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_sub_with_edit.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_sale_screen_widgets/filter_section_for_all_sale.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_sale_screen_widgets/full_sale_list_for_all_sales.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/all_sale_screen_widgets/sale_and_price_container_for_all_sale.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/dropdown_for_dashboard.dart';

class AllSaleDataScreen extends StatelessWidget {
  AllSaleDataScreen({super.key});

  final ValueNotifier<String?> _selectedValue = ValueNotifier(list[0]);

  final ValueNotifier<DateTime> pickedStartDateNotifier =
      ValueNotifier(getTheCurrentDateStartOrEnd(currentDate: CurrentDate.week));
  final ValueNotifier<DateTime> pickedEndDateNotifier = ValueNotifier(
      getTheCurrentDateStartOrEnd(currentDate: CurrentDate.week, start: false));

  Future<void> _loadData() async {
    await getAllCustomersFormDB();
    await getAllSalesFromDB();
    getTheCurrentDate(CurrentDate.week);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForSubWithEdit(
          title: "All sales",
          isAddIcon: false,
        ),
      ),
      body: LayoutBuilder(
          builder: (context, constraints) =>
              constraints.maxWidth < 600 && !kIsWeb
                  ? ListView(
                      shrinkWrap: true,
                      children: [
                        //divider
                        const Divider(),

                        //filter
                        FilterSectionForAllSale(
                          selectedValue: _selectedValue,
                          pickedStartDateNotifier: pickedStartDateNotifier,
                          pickedEndDateNotifier: pickedEndDateNotifier,
                        ),

                        //divider
                        const Divider(),

                        const SalesAndPriceContainerForAllSale(),

                        //list builder
                        FutureBuilder(
                          future: _loadData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              return const FullSaleListForAllSales();
                            }
                          },
                        ),
                      ],
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        //divider
                        const Divider(),

                        //filter
                        FilterSectionForAllSale(
                          selectedValue: _selectedValue,
                          pickedStartDateNotifier: pickedStartDateNotifier,
                          pickedEndDateNotifier: pickedEndDateNotifier,
                        ),

                        //divider
                        const Divider(),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //list builder
                            Expanded(
                              child: FutureBuilder(
                                future: _loadData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: double.infinity,
                                      height: MyScreenSize.screenHeight * .5,
                                      alignment: AlignmentDirectional.center,
                                      child: const CircularProgressIndicator
                                          .adaptive(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Container(
                                      width: double.infinity,
                                      height: MyScreenSize.screenHeight * .5,
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        'Error: ${snapshot.error}',
                                      ),
                                    );
                                  } else {
                                    return const FullSaleListForAllSales();
                                  }
                                },
                              ),
                            ),

                            const SalesAndPriceContainerForAllSale(),
                          ],
                        )
                      ],
                    )),
    );
  }
}
