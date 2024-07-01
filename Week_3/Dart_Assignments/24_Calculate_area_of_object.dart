// 24. Write a menu driven program to calculate the area of a given object.

import 'dart:io';

int main() {
  Area ar = new Area();

  double breadth = 0, length = 0, height = 0, radius = 0;

  stdout.write("Select one option \n-------------------------------\n");
  write("1. Circle \n2. Square \n3. Rectangle \n4. Triangle \n>> ");
  int select = getInput().toInt();

  switch (select) {
    case 1:
      write("Enter radius: ");
      radius = getInput();
      write("Area = ");
      print(ar.circle(radius: radius));
    case 2:
      write("Enter length: ");
      length = getInput();
      write("Area = ");
      print(ar.square(length: length));
    case 3:
      write("Enter length: ");
      length = getInput();
      write("Enter breadth: ");
      breadth = getInput();
      write("Area = ");
      print(ar.rectangle(length: length, breadth: breadth));
    case 4:
      write("Enter base length: ");
      breadth = getInput();
      write("Enter height: ");
      height = getInput();
      write("Area = ");
      print(ar.triangle(length: height, breadth: breadth));
    default:
      print("You have eyes right?");
  }

  return 0;
}

double getInput() {
  while (true) {
    try {
      String input = stdin.readLineSync() ?? '1';
      return double.parse(input);
    } catch (e) {
      print("Invalid!, try again.");
    }
  }
}

void write(String str) {
  return stdout.write(str);
}

class Area {
  final double pi = 3.14;
  double area = 0;
  double circle({required double radius}) {
    return area = (pi * (radius * radius));
  }

  double square({required double length}) {
    return area = (length * length);
  }

  double rectangle({required double length, required double breadth}) {
    return area = (length * breadth);
  }

  double triangle({required double length, required double breadth}) {
    return area = (1 / 2) * (length * breadth);
  }
}
