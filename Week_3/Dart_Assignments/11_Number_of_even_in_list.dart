// 11. Write a program to find the number of even numbers in an list

import 'dart:io';

int main() {
  int limit;
  List<int> list = [];
  int noOfEven = 0;
  stdout.write("Enter the limit: ");
  String? input = stdin.readLineSync() ?? "0";

  try {
    limit = int.parse(input);
  } catch (e) {
    print("Invalid!");
    return 1;
  }

  stdout.write("Enter the value of list: ");
  for (int i = 0; i < limit; i++) {
    String? listInput = stdin.readLineSync();
    if (listInput != null) {
      try {
        list.add(int.parse(listInput));
        if(list[i].isEven){
          noOfEven++;
        }
      } catch (e) {
        print("Empty, try again!");
        return 1;
      }
    }
  }
  print("List: $list");
  print("The number of even number in the given list is $noOfEven");



  return 0;
}
