// 13.Write a program to identify whether a string is a palindrome or not

import 'dart:io';

int main() {
  print("Enter a string to find it is palindrome or not ");
  stdout.write(">>");
  String str = stdin.readLineSync() ?? '';

// (str.split('').reversed.join() == str)? print("is palindrome"): print("not palindrome");

  int len = str.length;
  bool isPalindrome = true;
  for (int i = 0; i < len; i++) {
    if (str[i] != str[len - i - 1]) {
      isPalindrome = false;
    }
  }
  if (isPalindrome) {
    print("The string '$str' is palindrome");
  } else {
    print("Not palindrome");
  }

  return 0;
}
