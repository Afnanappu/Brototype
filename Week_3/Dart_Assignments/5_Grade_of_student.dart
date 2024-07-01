// 5.Write a program to show the grade obtained by a student 
//after he/she enters their total mark percentage.

import 'dart:io';

int main(){

  double totalMark = 0;

  stdout.write("Enter the total mark: ");
  String? input = stdin.readLineSync();
  if(input != null){
    try {
      totalMark = double.parse(input);
    }
    catch(e){
      print("Invalid entry, try again! ");
      return 1;
    }
  }
  
  if(totalMark>=90){
    if(totalMark<=100)
      print("A");
    else{
      print("Invalid total");
    }
  }
  else if(totalMark>=80){
    print("B");
  }
  else if(totalMark>=70){
    print("C");
  }
  else if(totalMark>=60){
    print("D");
  }
  else if(totalMark>=50){
    print("E");
  }
  else{
    print("Failed");
  }
  return 0;
}