void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
  rotateArray(arr, 2);
}

void rotateArray(List<int> arr, int steps) {
  int n = arr.length;
  steps = steps % n;
  if (steps == 0) {
    print('array after rotating $steps steps: $arr');
    return;
  }

  List<int> rotatedArray = arr.sublist(n - steps) + arr.sublist(0, n - steps);

  // for (int i = 0; i < steps; i++) {
  //   arr.insert(0, arr.removeLast());
  // }
  print('array after rotating $steps steps: $rotatedArray');
}
