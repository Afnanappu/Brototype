void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
  reverseAnArray(arr);
}

void reverseAnArray(List<int> arr) {
  int currentIndex = 0;
  int len = arr.length - 1;
  while (currentIndex < (len / 2)) {
    int temp = arr[currentIndex];
    arr[currentIndex] = arr[len - currentIndex];
    arr[len - currentIndex] = temp;

    currentIndex++;
  }

  print('Reversed array: $arr');
}
