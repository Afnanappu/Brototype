// 10. Write a program to interchange the values of two list.

import 'dart:io';

int main() {
  List<int> list1 = [], list2 = [];
  int limit;

  stdout.write("Enter the list limit: ");
  String input = stdin.readLineSync()!;
  try {
    limit = int.parse(input);
  } catch (e) {
    print("Invalid limit, try again! ");
    return 1;
  }
  try {
    print("Enter first list elements: ");
    for (int i = 0; i < limit; i++) {
      list1.add(int.parse(stdin.readLineSync()!));
    }
    print("Enter second list elements: ");
    for (int i = 0; i < limit; i++) {
      list2.add(int.parse(stdin.readLineSync()!));
      
      //swapping
      int temp = list1[i];
      list1[i] = list2[i];
      list2[i] = temp;
    }
  } catch (e) {
    print("Try again! ");
    return 1;
  }
  print("List after swapping ");
  print( "List1: $list1");
  print( "List2: $list2");

  return 0;
}
