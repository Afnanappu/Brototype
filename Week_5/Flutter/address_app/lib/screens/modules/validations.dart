String? nameValidate(String? input) {
  if (input != null) {
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (input.isEmpty) {
      return "Empty filed, add name!";
    } else if (!regex.hasMatch(input)) {
      return "Invalid name, try again!";
    }
  }
  return null;
}

String? ageValidate(String? input) {
  if (input != null) {
    final regex = RegExp(r'^\d+$');
    if (input.isEmpty) {
      return "Empty field, add age!";
    } else if (int.parse(input) > 140) {
      return 'Old man, please enter you current age!';
    } else if (!regex.hasMatch(input)) {
      return "Enter age properly, try again";
    }
  }
  return null;
}

String? phoneValidate(String? input) {
  if (input != null) {
    final regex = RegExp(r'[\d]{10}');
    if (input.isEmpty) {
      return "Empty field, add phone number!";
    } else if (!regex.hasMatch(input)) {
      return "Enter 10 digit number, try again";
    }
  }
  return null;
}
