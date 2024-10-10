void main() {
  List<int> arr = [1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10];

  print(findLeftMostIndex(arr, 0, arr.length - 1, 3));
}

int findLeftMostIndex(List<int> arr, int start, int end, int target) {
  if (start > end) {
    return -1;
  }
  int mid = start + (end - start) ~/ 2;

  if (arr[mid] == target) {
    if (arr[mid - 1] == target) {
      return findLeftMostIndex(arr, start, mid - 1, target);
    } else {
      return mid;
    }
  } else if (arr[mid] < target) {
    return findLeftMostIndex(arr, mid + 1, end, target);
  } else {
    return findLeftMostIndex(arr, start, mid - 1, target);
  }
}
