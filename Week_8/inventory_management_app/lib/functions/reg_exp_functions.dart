class CustomRegExp {
  static bool checkEmptySpaces(String value) {
    return RegExp(r'^\s*$').hasMatch(value);
  }

  static bool checkPhoneNumber(String value) {
    return RegExp(r'^[0-9]{10}$').hasMatch(value);
  }

  static bool checkNumberOnly(String value) {
    return RegExp(r'^[1-9]\d*$').hasMatch(value);
  }

  static bool checkName(String value) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }
}
