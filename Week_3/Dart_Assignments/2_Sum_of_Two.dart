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

  int number1 = getInput("Enter first number: ").toInt();
  double number2 = getInput("Enter second number: ").toDouble();

  double sum =  number1 + number2 ;

  print("The sum is ${sum}");
}
