// 27. Write a program to print the corresponding Celsius to Fahrenheit table.

int main() {
  double fahrenheit = 0;
  print("Fahrenheit   Celsius");
  for (double celsius = 0; celsius <= 150; celsius += 10) {
    fahrenheit = (celsius * (9 / 5)) + 32;
    print("   $fahrenheit       $celsius");
  }

  return 0;
}
