//2. Accept two inputs from the user and output its sum.
import 'dart:io';

void main() {
  num getInput(output) {
    while (true) {
      stdout.write(output);
      String? input = stdin.readLineSync();
      if (input != null) {
        try {
          return num.parse(input);
        } catch (e) {
          print("Invalid entry, try again! ");
        }
      }
    }
  }

  num number1 = getInput("Enter first number: ");
  num number2 = getInput("Enter second number: ");

  num sum = number2 + number1;

  print("The sum is ${sum}");
}
