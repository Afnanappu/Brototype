extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double? parseDouble() {
    return double.tryParse(this);
  }
}

