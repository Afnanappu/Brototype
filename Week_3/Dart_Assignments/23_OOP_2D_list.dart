// 23. Write an object oriented program to store and display the values of a 2D array

import 'dart:io';

int main() {
  TwoDList Lists = new TwoDList();
  int limit = Lists.getInput("Enter the size of the list: ");
  List<List<int>> list = List.generate(limit, (_) => List.filled(limit, 0));
  print("Enter the list values: ");
  list = Lists.getList(limit, list);
  print("List elements are: ");
  Lists.displayList(limit, list);

  return 0;
}

class TwoDList {
  int getInput([String message = "Enter: "]) {
    while (true) {
      stdout.write(message);
      try {
        String input = stdin.readLineSync() ?? "2";
        return int.parse(input);
      } catch (e) {
        print("Invalid!, try again");
      }
    }
  }

  List<List<int>> getList(int limit, List<List<int>> list) {
    for (int i = 0; i < limit; i++) {
      for (int j = 0; j < limit; j++) {
        list[i][j] = getInput("Element[$i][$j]: ");
      }
    }
    return list;
  }

  void displayList(int limit, List<List<int>> list){
    for (int i = 0; i < limit; i++) {
      for (int j = 0; j < limit; j++) {
        stdout.write("${list[i][j]} ");
      }
      print("");
    }
  }
}
