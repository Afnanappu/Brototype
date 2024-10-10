import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';

final List<String> list = ['Last week', 'Last month', 'This year', 'All Sales'];

class DropDownForDashboard extends StatelessWidget {
  const DropDownForDashboard({
    super.key,
    required ValueNotifier<String?> selectedValue,
  }) : _selectedValue = selectedValue;

  final ValueNotifier<String?> _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //date select
      child: DropdownButtonFormField(
        dropdownColor: MyColors.white,
        padding: const EdgeInsets.only(left: 20),
        value: _selectedValue.value,
        decoration: const InputDecoration(border: InputBorder.none),
        items: list.map(
          (e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          },
        ).toList(),
        onChanged: (value) {
          _selectedValue.value = value;
          if (_selectedValue.value == list[0]) {
            getTheCurrentDate(CurrentDate.week);
            getGraphBasedOnSales(currentDate: CurrentDate.week);
          } else if (_selectedValue.value == list[1]) {
            getTheCurrentDate(CurrentDate.month);
          } else if (_selectedValue.value == list[2]) {
            getTheCurrentDate(CurrentDate.year);
          } else {
            getTheNumberOfItemSold();
            getThePriceAmountOfItemSold();
          }
        },
      ),
    );
  }
}
