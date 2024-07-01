//28.  Write a program that will take the bits in a number and shift
//them to the left end. For example, 01010110 (binary) would become 11110000 (binary).

import 'dart:io';

int main() {
  stdout.write("Enter a binary number: ");
  String input = stdin.readLineSync() ?? '';
  if (!RegExp(r'^[01]+$').hasMatch(input)) {
    print("Enter 0 and 1 (Binary) numbers");
    return 1;
  }

  int length = input.length;
  int noOne = input.split('').where((bit) => bit == '1').length;
  int noZero = length - noOne;
  String result = '1' * noOne + '0' * noZero;

  print(result);

  return 0;
}
