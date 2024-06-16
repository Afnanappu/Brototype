// 1. Accept a char input from the user and display it on the console.
import 'dart:io';

void main(){

  stdout.write("Enter a character: ");
  String? char = stdin.readLineSync();
  print("The character you entered is '$char'");

}