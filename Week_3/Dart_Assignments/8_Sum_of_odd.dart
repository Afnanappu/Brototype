// 8.Write a program to find the sum of all the odd numbers for a given limit

import 'dart:io';

int main(){

  int limit,sum = 0;
  stdout.write("Enter a limit: ");
  String input = stdin.readLineSync()!;
  try{
    limit = int.parse(input);
  }
  catch(e){
    print("Invalid, try again! ");
    return 1;
  }
  for(int i = 0; i < limit; i+=2){
    sum += (i+1);
  }
  print("The sum of odd numbers = $sum");



return 0;
}