// 22. Write a program to add the values of two 2D arrays

import 'dart:io';

int main() {
  //Accepting a integer value form the user using getInput().
  int limit = getInput("Enter the limit of the 2D list: ");

  //Initializing lists using .generate method and filling the cell with 0.
  //(So we can change the values instead of appending to it.)
  List<List<int>> list1 = List.generate(limit, (_) => List.filled(limit, 0));
  List<List<int>> list2 = List.generate(limit, (_) => List.filled(limit, 0));
  List<List<int>> resList = List.generate(limit, (_) => List.filled(limit, 0));

  //Getting 2D Lists using get2DList()
  print("\nEnter the value 2D list1 ");
  list1 = get2DList(limit, list1);
  print("\nEnter the value of 2D list2 ");
  list2 = get2DList(limit, list2);

  //Adding list1 and list2 using add2DList()
  resList = add2DList(limit, List1: list1, List2: list2, resultList: resList);

  //Displaying the sum of two lists using displayList().
  print("\nThe Sum of list1 and list2: ");
  displayList(limit, resList);

  return 0;
}

//Function to get integer input from the user.
int getInput([String message = "Enter"]) {
  while (true) {
    stdout.write(message);
    try {
      String? input = stdin.readLineSync() ?? '1';
      return int.parse(input);
    } catch (e) {
      print("Invalid!, try again");
    }
  }
}

//Function to get 2D list from the user.
List<List<int>> get2DList(int limit, List<List<int>> list) {
  for (int i = 0; i < limit; i++) {
    for (int j = 0; j < limit; j++) {
      list[i][j] = getInput("Element[$i][$j]: ");
    }
  }
  return list;
}

//Function to add two 2D lists
List<List<int>> add2DList(int limit,
    {required List<List<int>> List1,
    required List<List<int>> List2,
    required List<List<int>> resultList}) {
  for (int i = 0; i < limit; i++) {
    for (int j = 0; j < limit; j++) {
      resultList[i][j] = List1[i][j] + List2[i][j];
    }
  }
  return resultList;
}

//Function to display the 2D list.
void displayList(int limit, List<List<int>> list) {
  for (int i = 0; i < limit; i++) {
    for (int j = 0; j < limit; j++) {
      stdout.write(" ${list[i][j]}");
    }
    print("");
  }
}
