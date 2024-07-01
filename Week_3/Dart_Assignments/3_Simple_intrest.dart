// 3.Write a program to find the simple interest.
//  Formula: SI=(P*R*n)/100)

import 'dart:io';

void main() {
  num getInput(output) {
    while (true) {
      stdout.write(output);
      String? input = stdin.readLineSync();
      if(input != null){
        try {
          return num.parse(input);
        }
        catch(e){
          print("Invalid entry, try again!");
        }
      }
    }
  }

  int P;
  double R, n, SI;


  P = getInput("Enter the principal amount: ").toInt();
  R = getInput("Enter the Interest rate: ").toDouble();
  n = getInput("Enter the Number of years: ").toDouble();
  SI = ((P*R*n)/100);

  print("The simple interest = $SI");
}
