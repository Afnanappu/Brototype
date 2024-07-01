// 16.Write a program to check whether a given number is prime or not

import 'dart:io';

int main() {
  int number;
  stdout.write("Enter a number: ");
  try {
    number = int.parse(stdin.readLineSync() ?? '0');
  } catch (e) {
    print("Try again! ");
    return 1;
  }
  bool isPrime = false;
  if(number<=1){
    print("Not prime");
    return 1;
  }
  for (int i = 2; i <= number / 2; i++) {
    if(number%i != 0){
      isPrime = true;
      break;
    }
  }
  if(isPrime == true){
    print("$number is prime");
  } else{
    print("Not prime");
  }


  return 0;
}
