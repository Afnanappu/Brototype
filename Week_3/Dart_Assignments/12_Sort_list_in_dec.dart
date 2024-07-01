// 12. Write a program to sort an list in descending order

import 'dart:io';

int main() {
  int limit;
  List<int> list = [];
  stdout.write("Enter the size of the list: ");
  String input = stdin.readLineSync() ?? "0";
  try {
    limit = int.parse(input);
  } catch (e) {
    print("limit empty, try again!");
    return 1;
  }
  stdout.write("Enter the list values: ");
  for (int i = 0; i < limit; i++) {
    try {
      String listInput = stdin.readLineSync() ?? "0";
      list.add(int.parse(listInput));
    } on FormatException {
      print("Error, enter values line by line, try again!");
      return 1;
    }
  }
  print("Before sorting: $list");

  for (int i = 0; i < limit - 1; i++) {
    for (int j = i + 1; j < limit; j++) {
      if (list[i] < list[j]) {
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
    }
  }
  print("After sorting: $list");

  return 0;
}
