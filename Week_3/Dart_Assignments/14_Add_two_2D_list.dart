// 14.Write a program to add to two dimensional lists

import 'dart:io';

int main(){

  stdout.write("Enter the list size: ");
  int limit = getInput();
  List<List<int>> list1 = List.generate(limit, (_) => List.filled(limit, 0));
  List<List<int>> list2 = List.generate(limit, (_) => List.filled(limit, 0));

  stdout.write("Enter list1 values: ");
  for(int i =0; i<limit;i++){
    for(int j=0; j<limit;j++){
      list1[i][j] = getInput();
    }
  }
  print("List1: $list1");

  stdout.write("Enter list2 values: ");
  for(int i =0; i<limit;i++){
    for(int j=0; j<limit;j++){
      list2[i][j] = getInput();
    }
  }
  print("List2: $list2");

  //adding list1 and list2

  List<List<int>> sumList = List.generate(limit, (_)=> List.filled(limit, 0));

  for(int i = 0; i<limit; i++){
    for(int j = 0; j<limit; j++){
      sumList[i][j] = list2[i][j] + list1[i][j];
    }
  }

  print("Sum of 2 list is: \n$sumList");

return 0;
}

int getInput(){
  return int.parse(stdin.readLineSync()??"0");
}