import 'package:flutter/material.dart';
import 'package:inventory_management_app/constants/colors.dart';
import 'package:inventory_management_app/database/sales_fun.dart';
import 'package:inventory_management_app/functions/date_time_functions.dart';
import 'package:inventory_management_app/widgets/dashboard_screen_widgets/dropdown_for_dashboard.dart';

class FilterSectionForAllSale extends StatelessWidget {
  const FilterSectionForAllSale({
    super.key,
    required ValueNotifier<String?> selectedValue,
    required this.pickedStartDateNotifier,
    required this.pickedEndDateNotifier,
  }) : _selectedValue = selectedValue;

  final ValueNotifier<String?> _selectedValue;
  final ValueNotifier<DateTime> pickedStartDateNotifier;
  final ValueNotifier<DateTime> pickedEndDateNotifier;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            //dropdown
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
                  pickedStartDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.week);
                  pickedEndDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.week, start: false);
                } else if (_selectedValue.value == list[1]) {
                  getTheCurrentDate(CurrentDate.month);
                  pickedStartDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.month);
                  pickedEndDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.month, start: false);
                } else {
                  getTheCurrentDate(CurrentDate.year);
                  pickedStartDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.year);
                  pickedEndDateNotifier.value = getTheCurrentDateStartOrEnd(
                      currentDate: CurrentDate.year, start: false);
                }
              },
            ),
          ),

          //divider
          const VerticalDivider(
            color: MyColors.lightGrey,
            thickness: 1.5,
            width: 15,
            indent: 10,
            endIndent: 10,
          ),

          //Date
          Row(
            children: [
              //Date From
              IconButton(
                onPressed: () async {
                  final pickedDate = await pickDateFromUser(
                      context: context,
                      initialDate: pickedStartDateNotifier.value);
                  if (pickedDate != null) {
                    pickedStartDateNotifier.value = pickedDate;
                    getSalesBasedOnDateTime(
                        startDate: pickedDate,
                        endDate: pickedEndDateNotifier.value);
                    getTheNumberOfItemSold(
                      start: pickedDate,
                      end: pickedEndDateNotifier.value,
                    );
                    getThePriceAmountOfItemSold(
                      start: pickedDate,
                      end: pickedEndDateNotifier.value,
                    );
                  }
                },
                icon: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    ValueListenableBuilder(
                      valueListenable: pickedStartDateNotifier,
                      builder: (context, value, child) => Text(
                        formatDateTime(date: value),
                        style: const TextStyle(
                            color: MyColors.blackShade,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),

              const Text(
                'TO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              //Date To
              TextButton(
                style: ButtonStyle(
                    foregroundColor: WidgetStateColor.resolveWith(
                  (_) => MyColors.blackShade,
                )),
                onPressed: () async {
                  final pickedDate = await pickDateFromUser(
                      context: context,
                      initialDate: pickedEndDateNotifier.value);
                  if (pickedDate != null) {
                    pickedEndDateNotifier.value = pickedDate;
                    getSalesBasedOnDateTime(
                      startDate: pickedStartDateNotifier.value,
                      endDate: pickedDate,
                    );

                    getTheNumberOfItemSold(
                      start: pickedStartDateNotifier.value,
                      end: pickedDate,
                    );
                    getThePriceAmountOfItemSold(
                      start: pickedStartDateNotifier.value,
                      end: pickedDate,
                    );
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: pickedEndDateNotifier,
                  builder: (context, value, child) => Text(
                    formatDateTime(date: value),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
