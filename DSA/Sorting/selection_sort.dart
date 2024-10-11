void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  print('Original array: $arr');
  unknownSort(arr);

}

void unknownSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  print(arr);
}
