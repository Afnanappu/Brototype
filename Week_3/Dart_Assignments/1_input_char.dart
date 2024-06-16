// 1. Accept a char input from the user and display it on the console.
import 'dart:io';

void main(){

  stdout.write("Enter a character: ");
  String? char = stdin.readLineSync()??"";
  if (char.length == 1){
    print("The character is '$char' ");
  }
  else {
    print("Enter one character");
  }

}
