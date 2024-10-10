import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/database/customer_fun.dart';
import 'package:inventory_management_app/database/return_fun.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/models/customer_model.dart';
import 'package:inventory_management_app/models/item_model.dart';
import 'package:inventory_management_app/models/profile_model.dart';
import 'package:inventory_management_app/screens/main_screens/home_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/notification_screen.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_main.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/customer_list_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/resent_sale_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/dropdown_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/graph_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/return_sale_button_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/return_sale_list_for_dashboard.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/sale_and_price_container_for_dashboard.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  ProfileModel? profile;

  final ValueNotifier<String?> _selectedValue = ValueNotifier(list[0]);

  final today = DateTime.now();

  Future<void> _fetchSaleData() async {
    await getAllCustomersFormDB();
    await getAllSalesFromDB();

    fun();
  }

  Future<void> _fetchReturnData() async {
    await getAllReturnedItemFromDb();
    await getAllSalesFromDB();
  }

  void fun() {
    getTheCurrentDate(CurrentDate.week);
    getGraphBasedOnSales(currentDate: CurrentDate.week);
    notifyAnyListeners(graphPointListNotifier);
  }

  // Future<void>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: AppBarForMain(
            title: HomeScreen.profileName,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NotificationScreen(),
                ),
              );
            }),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 600 && !kIsWeb
            ?
            //For Android
            CustomScrollView(
                slivers: [
                  //Dropdown menu
                  SliverToBoxAdapter(
                      child:
                          DropDownForDashboard(selectedValue: _selectedValue)),

                  //Sale and price container that show based on the dropdown menu
                  const SliverToBoxAdapter(
                      child: SaleAndPriceContainerForDashboard()),

                  //Graph
                  const SliverToBoxAdapter(child: GraphForDashboard()),

                  //Resent sales button
                  const SliverToBoxAdapter(
                      child: ResentSalesButtonForDashboard()),

                  //resent
                  FutureBuilder(
                    future: _fetchSaleData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      } else {
                        return (customerListNotifier.value.isEmpty)
                            ? SliverToBoxAdapter(
                                child: Container(
                                  width: double.infinity,
                                  height: MyScreenSize.screenHeight * .2,
                                  alignment: AlignmentDirectional.center,
                                  child: const Text('No sale is added'),
                                ),
                              )

                            //sales list
                            : const CustomerListForDashboard();
                      }
                    },
                  ),

                  const SliverToBoxAdapter(
                      child: ReturnSaleButtonForDashboard()),

                  FutureBuilder(
                    future: _fetchReturnData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()));
                      } else if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      } else {
                        return const ReturnSaleListForDashboard();
                      }
                    },
                  ),
                ],
              )
            :

            //For Web
            ListView(
                shrinkWrap: true,
                children: [
                  //Dropdown menu
                  DropDownForDashboard(selectedValue: _selectedValue),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Graph
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const GraphForDashboard(),
                          //Resent sales button
                          const ResentSalesButtonForDashboard(),

                          //resent
                          FutureBuilder(
                            future: _fetchSaleData(),
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
                                return (customerListNotifier.value.isEmpty)
                                    ? Container(
                                        width: double.infinity,
                                        height: MyScreenSize.screenHeight * .2,
                                        alignment: AlignmentDirectional.center,
                                        child: const Text('No sale is added'),
                                      )

                                    //sales list
                                    : const CustomerListForDashboard();
                              }
                            },
                          ),

                          // returns
                          const ReturnSaleButtonForDashboard(),

                          FutureBuilder(
                            future: _fetchReturnData(),
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
                                return const ReturnSaleListForDashboard();
                              }
                            },
                          ),
                        ],
                      )),

                      //Sale and price container that show based on the dropdown menu
                      const SaleAndPriceContainerForDashboard(),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButtonForAll(
//   text: 'Add new sale',
//   onPressed: () {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (ctx) => const SaleAddNew()));
//   },
//   color: MyColors.red,
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
