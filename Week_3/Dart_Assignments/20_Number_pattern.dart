// 20. Write a program to print the following pattern using for loop

import 'dart:io';

int main() {
  int limit = 4;
  stdout.write("Enter the limit of pattern: ");
  try {
    String? input = stdin.readLineSync() ?? "4";
    limit = int.parse(input);
  } catch (e) {
    print("Default value 4 taken");
  }
  int count = 1;

  for (int i = 0; i < limit; i++) {
    for (int j = 0; j <= i; j++) {
      stdout.write("$count ");
      count++;
    }
    print("");
  }

  return 0;
}
