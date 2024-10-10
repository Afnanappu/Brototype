void main() {
  convert('xyz', 3);
  change('haaakkkwe');
}

void change(String message) {
  if (message.isEmpty) {
    print('');
    return ;
  }
  int currentIndex = 0, nextIndex = currentIndex + 1;
  int count = 1;
  StringBuffer newString = StringBuffer('');
  while (currentIndex < message.length) {
    if (nextIndex < message.length &&
        message[currentIndex] == message[nextIndex]) {
      count++;
      nextIndex++;
    } else {
      newString.write('$count${message[currentIndex]}');
      currentIndex += count;
      nextIndex = currentIndex + 1;
      count = 1;
    }
  }
  print(newString);
}

String convert(String message, int key) {
  int newKey = key % 26;
  print('newKey = ${newKey}');
  List<int> newMessageOfInt = [];

  for (var i = 0; i < message.length; i++) {
    int codeUnit = message.codeUnitAt(i) + newKey;
    if (codeUnit <= 122) {
      newMessageOfInt.add(codeUnit);
    } else {
      newMessageOfInt.add(96 + codeUnit % 122);
    }
  }

  String newMessage = String.fromCharCodes(newMessageOfInt);
  print(newMessage);
  return newMessage;
}
