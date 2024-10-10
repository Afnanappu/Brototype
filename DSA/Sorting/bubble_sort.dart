void main() {
  List<int> arr = [8, 7, 6, 5, 4, 3, 2, 1];
  bubbleSort(arr);
}

void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
  print(arr);
}
