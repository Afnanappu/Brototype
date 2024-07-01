// 17. Write a menu driven program to do the basic mathematical operations
//such as addition, subtraction, multiplication and division (hint: use if else ladder or switch)

import 'dart:io';

int main() {
  num number1, number2, result = 0;
  int select = 1;
  print(
      "\nSelect one operation from the list\n--------------------------------------");
  stdout.write(
      "1. Addition\n2. Subtraction\n3. Multiplication\n4. Division\n>> ");
  select = getInput().toInt();
  stdout.write("Enter the first number: ");
  number1 = getInput();
  stdout.write("Enter the second number: ");
  number2 = getInput();

  Calculator calc = new Calculator();

  switch (select) {
    case 1: result = calc.addition(number1, number2);
    case 2: result = calc.subtraction(number1, number2);
    case 3: result = calc.multiplication(number1, number2);
    case 4: result = calc.division(number1, number2);
    default: print("Invalid selection, try again! ");
  }

  print("Result = $result");


  return 0;
}

class Calculator {
  num addition(num number1, num number2) {
    return (number1 + number2);
  }

  num subtraction(num number1, num number2) {
    return (number1 - number2);
  }

  num multiplication(num number1, num number2) {
    return (number1 * number2);
  }

  num division(num number1, num number2) {
    return (number1 / number2);
  }
}

num getInput() {
  while (true) {
    try {
      String? input = stdin.readLineSync();
      if (input != null) {
        return num.parse(input);
      }
    } on FormatException {
      print("Invalid entry, try again");
    } catch (e) {
      print('try again!');
    }
  }
}
