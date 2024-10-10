void main() {
  String str = 'A+B-C-(D*E)/F+12';
  print(infixToPostfix(str));
}

String infixToPostfix(String str) {
  StringBuffer newStr = StringBuffer();
  final stack = <String>[];
  for (int i = 0; i < str.length; i++) {
    if (RegExp(r'[a-zA-Z0-9]').hasMatch(str[i])) {
      newStr.write(str[i]);
    } else if (str[i] == '(') {
      stack.add(str[i]);
    } else if (str[i] == ')') {
      while (stack.isNotEmpty && stack.last != '(') {
        newStr.write(stack.removeLast());
      }
      if (stack.isNotEmpty && stack.last == '(') {
        stack.removeLast();
      }
    } else {
      while (stack.isNotEmpty &&
          checkPrecedence(str[i]) <= checkPrecedence(stack.last)) {
        newStr.write(stack.removeLast());
      }
      stack.add(str[i]);
    }
  }
  return newStr.toString();
}

int checkPrecedence(String char) {
  if (char == '+' || char == '-') {
    return 1;
  } else if (char == '*' || char == '/') {
    return 2;
  } else {
    return 0;
  }
}
