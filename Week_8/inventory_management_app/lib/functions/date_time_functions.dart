import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management_app/database/sales_fun.dart';

enum CurrentDate { week, month, year }

void getTheCurrentDate(CurrentDate currentDate) {
  // final today = DateTime.now();
  late DateTime startDate;
  DateTime? endDate;

  switch (currentDate) {
    case CurrentDate.week:
      startDate = getTheCurrentDateStartOrEnd(currentDate: CurrentDate.week);
      endDate = getTheCurrentDateStartOrEnd(
          currentDate: CurrentDate.week, start: false);
      print('Last week');
      break;

    case CurrentDate.month:
      startDate = getTheCurrentDateStartOrEnd(currentDate: CurrentDate.month);
      endDate = getTheCurrentDateStartOrEnd(
          currentDate: CurrentDate.week, start: false);
      print('Last month');

    case CurrentDate.year:
      startDate = getTheCurrentDateStartOrEnd(currentDate: CurrentDate.year);
      print('Last year');
    default:
      print('Nothing worked in getTheCurrentDate()');
  }
  getSalesBasedOnDateTime(startDate: startDate, endDate: endDate);
  getTheNumberOfItemSold(start: startDate, end: endDate);
  getThePriceAmountOfItemSold(start: startDate, end: endDate);
}

Future<DateTime?> pickDateFromUser(
    {required BuildContext context, DateTime? initialDate}) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ??= DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );

  return pickedDate;
}

String formatDateTime({required DateTime date}) {
  return DateFormat('dd/MM/yy').format(date);
}

DateTime getTheCurrentDateStartOrEnd(
    {required CurrentDate currentDate, bool start = true, DateTime? time}) {
  time ??= DateTime.now();

  switch (currentDate) {
    case CurrentDate.week:
      switch (start) {
        case true:
          return time.subtract(
            Duration(
              days: (time.weekday - 1) + 7,
            ),
          );
        case false:
          return time.subtract(
            Duration(
              days: time.weekday - 1,
            ),
          );
      }
    case CurrentDate.month:
      switch (start) {
        case true:
          return DateTime(time.year, time.month - 1, 1);
        case false:
          return DateTime(time.year, time.month, 1).subtract(
            const Duration(days: 1),
          );
      }
    case CurrentDate.year:
      switch (start) {
        case true:
          return DateTime(time.year, 1, 1);
        case false:
          final end = DateTime(time.year + 1, 1, 1).subtract(
            const Duration(days: 1),
          );
          if (time.isBefore(end)) {
            return DateTime(time.year, time.month, time.day);
          } else {
            return end;
          }
      }
  }
}
