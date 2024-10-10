import 'package:flutter/material.dart';
import 'package:inventory_management_app/screens/main_screens/account_screen.dart';
import 'package:inventory_management_app/screens/main_screens/dashboard_screen.dart';
import 'package:inventory_management_app/screens/main_screens/home_screen.dart';
import 'package:inventory_management_app/screens/main_screens/item_screen.dart';
import 'package:inventory_management_app/widgets/common/bottom_navigation_bar.dart';

// ignore: must_be_immutable
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

ValueNotifier<bool> isKeyboardVisible = ValueNotifier(false);

class _MainHomeScreenState extends State<MainHomeScreen> {
  int currentIndex = 0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible.value = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
          _pageViewController.jumpToPage(currentIndex);
        },
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          DashboardScreen(),
          const ItemScreen(),
          const AccountScreen()
        ],
      ),
      //todo: Change the icon
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        pageController: _pageViewController,
      ),
    );
  }
}
