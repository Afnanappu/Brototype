void main() {
  print(countVowels('aeiou HoL'));
}

int countVowels(String input) {
  final String vowelsLetter = 'aeiouAEIOU';
  int vowels = 0;

  for (int i = 0; i < input.length; i++) {
    if (vowelsLetter.contains(input[i])) {
      vowels++;
    }
  }
  return vowels;
}
