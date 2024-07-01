// 21. Write a program to multiply the adjacent values of a list
//and store it in an another list

import 'dart:io';

int main(){
  stdout.write("Enter the list limit: ");
  int limit = getInput();
  List<int> list = [], resList = [];
  list = getList(list, limit);
  resList = multiplyAdj(limit, list: list, resList: resList);
  stdout.write("The result list is = ");
  displayList(resList, limit);

return 0;
}

int getInput(){
  while(true){
    try{
      String input = stdin.readLineSync()??'3';
      return int.parse(input);
    } catch(e){
      print("Invalid, try again!");
    }
  }
}

List<int> getList(List<int> list, int limit){
  while(true){
    stdout.write("Enter the list elements: ");
    try{
      for(int i = 0; i < limit; i++){
       list.add(getInput());
      }
      return list;
    } catch(e){
      print("try again");
    }
  }
}

List<int> multiplyAdj(int limit, {required List<int> list, required List<int> resList}){
  for(int i = 0; i < limit-1; i++){
    resList.add(list[i]*list[i+1]);
  }
  return resList;
}

void displayList(List<int> list, int limit){
  for(int i = 0; i < limit-1; i++){
    stdout.write("${list[i]} ");
  }
}