// 7. Write a program to print the multiplication table of given numbers.

import 'dart:io';

int main(){
  int number;
  stdout.write("Enter a number: ");
  String input = stdin.readLineSync()!;
  try{
    number = int.parse(input);
  }
  catch(e) {
    print("Invalid, try again!");
    return 1;
  }
  for(int i = 0; i < 10; i++){
    print("${i+1} X $number = ${(i+1)*number}");
  }


return 0;
}