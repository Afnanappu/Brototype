import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/constants/screen_size.dart';
import 'package:inventory_management_app/database/brand_fun.dart';
import 'package:inventory_management_app/models/profile_model.dart';
import 'package:inventory_management_app/screens/main_home_screen.dart';
import 'package:inventory_management_app/screens/sub_screens/add_new_sale.dart';
import 'package:inventory_management_app/screens/sub_screens/notification_screen.dart';
import 'package:inventory_management_app/widgets/appbar/app_bar_for_main.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/brand_items.dart';
import 'package:inventory_management_app/widgets/common/floating_action_button.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/item_details_for_home.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/price_filter.dart';
import 'package:inventory_management_app/widgets/home_screen_widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String profileName = 'Shop Name';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileModel? profile;

  @override
  void initState() {
    _loadDB();

    super.initState();
  }

  Future<void> _loadDB() async {
    await getAllItemBrandFromDB();
    profile = await getProfile();
    if (profile != null) {
      HomeScreen.profileName = profile!.name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
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

      //body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MyScreenSize.screenHeight18),
        child: const CustomScrollView(
          slivers: [
            //Search bar
            SliverToBoxAdapter(child: SearchBarForMain()),

            //Brand items
            SliverToBoxAdapter(child: BrandItemsForHome()),

            //Price filter
            SliverToBoxAdapter(child: PriceFilter()),

            //Item Details
            ItemDetailsForHome(),
          ],
        ),
      ),

      floatingActionButton: ValueListenableBuilder(
        valueListenable: isKeyboardVisible,
        builder: (context, value, child) => Visibility(
          visible: !value,
          child: FloatingActionButtonForAll(
            text: 'Add new sale',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SaleAddNew()));
            },
            color: MyColors.red,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
