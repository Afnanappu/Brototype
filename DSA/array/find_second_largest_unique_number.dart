void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
  findTheSecondLargestUniqueNumber(arr);
}

void findTheSecondLargestUniqueNumber(List<int> arr) {
  if (arr.length < 2) {
    print('Array must want at least two elements to find second largest.');
    return;
  }

  Map<int, int> frequency = {};

  for (var num in arr) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }

  int? largest, secondLargest;

  for (int num in arr) {
    if (frequency[num] == 1) {
      if (largest == null || num > largest) {
        secondLargest = largest;
        largest = num;
      } else if (num != largest &&
          (secondLargest == null || secondLargest < num)) {
        secondLargest = num;
      }
    }
  }
  if (secondLargest == null) {
    print('No second largest found, all element are same');
  } else {
    print('largest: $largest, secondLargest: $secondLargest');
  }
}
