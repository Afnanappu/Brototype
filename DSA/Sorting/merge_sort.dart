void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
  mergeSort(arr);
  print('sorted array: $arr');
}

List<int> merge(List<int> left, List<int> right) {
  List<int> sortedList = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] > right[j]) {
      sortedList.add(right[j]);
      j++;
    } else {
      sortedList.add(left[i]);
      i++;
    }
  }
  sortedList.addAll(left.sublist(i));
  sortedList.addAll(right.sublist(j));

  return sortedList;
}

List<int> mergeSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);
  return merge(mergeSort(left), mergeSort(right));
}
