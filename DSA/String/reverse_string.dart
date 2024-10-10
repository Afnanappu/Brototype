void main() {
  print(reverseString('afnan'));
}

String reverseString(String input) {
  int len = input.length -1;
  String reverse(int length) {
    if (length >= 0) {
      return input[length] + reverse(length - 1);
    }
    return '';
  }
  return reverse(len);
}
