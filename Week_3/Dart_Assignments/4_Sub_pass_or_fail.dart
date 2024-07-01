// 4. Write a program to check whether a student has passed or failed 
// in a subject after he or she enters their mark 
//(pass mark for a subject is 50 out of 100).

import 'dart:io';

int main(){

  double mark = 0;

  stdout.write("Enter the mark: ");
  String? input = stdin.readLineSync();
  if(input != null){
    try {
      mark = double.parse(input);
    }
    catch(e){
      print("Invalid, try again! ");
      return 1;
    }
  }

  if(mark >= 50 && mark <=100){
    print("Passed");
  }
  else if(mark >100){
    print("Invalid mark");
  }
  else {
    print("Failed");
  }
  return 0;
}