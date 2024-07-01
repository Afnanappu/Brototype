// 18. Write a program to find the grade of a student during his academic year.

import 'dart:io';

int main() {
  print("Enter the mark scored by the students ");
  stdout.write('Written test: ');
  int test = getInput();
  stdout.write('Lab exams: ');
  int Lab = getInput();
  stdout.write('Assignments: ');
  int assign = getInput();

  double grade = ((test * 70) / 100 + (Lab * 20) / 100 + (assign * 10) / 100);

  stdout.write('Grade of the student is $grade');

  return 0;
}

int getInput() {
  while (true) {
    try {
      String? input = stdin.readLineSync() ?? '0';
      return int.parse(input);
    } catch (e) {
      print("Invalid entry, try again!");
    }
  }
}
