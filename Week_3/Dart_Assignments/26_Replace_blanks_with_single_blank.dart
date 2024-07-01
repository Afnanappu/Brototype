//26. Write a program to copy its input to its output,
//replacing each string of one or more blanks by a single blank.

import 'dart:io';

int main() {
  String? string;
  stdout.write("Enter some string: ");
  try {
    string = stdin.readLineSync() ?? '';
  } catch (e) {
    print("Try again.");
    return 1;
  }
  string = string.replaceAll(RegExp(r'\s+'), ' ');

  print("After extra blank space removed: $string");

  return 0;
}
