import 'package:intl/intl.dart';

String formatMoney({
  required double number,
  bool haveSymbol = true,
  bool haveEndSymbol = false,
}) {
  String formattedMoney = '';

  if (haveEndSymbol == true) {
    if (number >= 10000000) {
      formattedMoney = NumberFormat.currency(
        locale: 'en_IN',
        symbol: haveSymbol == true ? '₹' : '',
        decimalDigits: 2,
      ).format((number / 10000000));
      formattedMoney += 'C';
    } else if (number >= 100000) {
      formattedMoney = NumberFormat.currency(
        locale: 'en_IN',
        symbol: haveSymbol == true ? '₹' : '',
        decimalDigits: 2,
      ).format((number / 100000));
      formattedMoney += 'L';
    } else {
      formattedMoney = NumberFormat.currency(
        locale: 'en_IN',
        symbol: haveSymbol == true ? '₹' : '',
        decimalDigits: 2,
      ).format(number);
    }
  } else {
    formattedMoney = NumberFormat.currency(
      locale: 'en_IN',
      symbol: haveSymbol == true ? '₹' : '',
      decimalDigits: 2,
    ).format(number);
  }

  return formattedMoney;
}
