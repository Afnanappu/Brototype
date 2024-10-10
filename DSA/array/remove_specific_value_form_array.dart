void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
  removeSpecificValueFromArray(arr, 5);
}

void removeSpecificValueFromArray(List<int> arr, int value) {
  List<int> newArray = arr
      .where(
        (element) => element != value,
      )
      .toList();

  print(newArray);
}
