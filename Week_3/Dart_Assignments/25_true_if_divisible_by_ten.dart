// 25. Write a function that returns TRUE if its parameter is divisible by 10 and FALSE otherwise.

import 'dart:io';

int main() {
  stdout.write("Enter a number: ");
  double number = getInput();
  print(divisibleByTen(number));

  return 0;
}

bool divisibleByTen(double number) {
  return (number % 10 == 0);
}

double getInput() {
  while (true) {
    try {
      String input = stdin.readLineSync()!;
      return double.parse(input);
    } catch (e) {
      print("Invalid!, try again.");
    }
  }
}
