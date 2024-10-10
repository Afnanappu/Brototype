void main() {
  fun(4);
  print('');
  int fact = factorial(5);
  print('Factorial of 5 is $fact');
}

void fun(int value) {
  if (value <= 1) {
    return;
  }
  fun(value - 1);
  print(value);
  fun(value - 1);
}

int factorial(int val) {
  if (val <= 1) {
    return 1;
  }
  return val + factorial(val - 1);
}
