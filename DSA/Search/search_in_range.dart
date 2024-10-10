void main() {
  List<int> arr = [1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10];

  print(binarySearchInRage(arr, 0, arr.length - 1, 2));
}

List<int> binarySearchInRage(List<int> arr, int start, int end, int target) {
  if (start > end) {
    return [];
  }
  int middle = start + (end - start) ~/ 2;
  if (arr[middle] == target) {
    return binarySearchInRage(arr, start, middle - 1, target) +
        [middle] +
        binarySearchInRage(arr, middle + 1, end, target);
  } else if (arr[middle] > target) {
    return binarySearchInRage(arr, start, middle - 1, target);
  } else {
    return binarySearchInRage(arr, middle + 1, end, target);
  }
}
