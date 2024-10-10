import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.pageController});
  int currentIndex;
  final PageController pageController;
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;
        });
        widget.pageController.jumpToPage(widget.currentIndex);
      },
      currentIndex: widget.currentIndex,
      selectedItemColor: MyColors.green,
      selectedIconTheme: const IconThemeData(
        color: MyColors.green,
      ),
      unselectedItemColor: MyColors.blackShade,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      enableFeedback: true,
      items: const <BottomNavigationBarItem>[
        //todo: Change the icon
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: MyColors.white),
        //todo: Change the icon
        BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), label: "Dashboard"),
        //todo: Change the icon
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
        //todo: Change the icon
        BottomNavigationBarItem(icon: Icon(Icons.business), label: "Account")
      ],
    );
  }
}
