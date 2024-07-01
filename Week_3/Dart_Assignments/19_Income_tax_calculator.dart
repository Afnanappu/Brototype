// 19. Write a program to find out the income tax amount of a person.

import 'dart:io';

int main() {
  stdout.write("Enter the annual income: ");
  int income = getInput();
  double tax = 0;
  if (income <= 250000) {
    print("No tax");
  } else if (income > 250000 && income <= 500000) {
    tax = (income * 5) / 100;
  } else if (income > 500000 && income <= 1000000) {
    tax = (income * 20) / 100;
  } else if (income > 1000000 && income <= 5000000) {
    tax = (income * 30) / 100;
  } else{
    print("🤨");
  }
  
  print("Income tax amount = $tax");

  return 0;
}

int getInput() {
  while (true) {
    try {
      String input = stdin.readLineSync() ?? '0';
      return int.parse(input);
    } catch (e) {
      print("Invalid, Try again");
    }
  }
}
