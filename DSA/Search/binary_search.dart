void main() {
  var list = List.generate(9000, (index) => index + 1);
  binarySearchIterator(list, 8000);
  var element = binarySearchRecursive(list, 0, list.length - 1, 8000);

  if (element == -1) {
    print('no element found');
  } else {
    print(element);
  }
}

int binarySearchRecursive(List<int> arr, int start, int end, int target) {
  if (start > end) {
    return -1;
  }
  int mid = start + (end - start) ~/ 2;
  if (arr[mid] == target) {
    return mid;
  } else if (arr[mid] < target) {
    return binarySearchRecursive(arr, mid + 1, end, target);
  } else {
    return binarySearchRecursive(arr, start, mid - 1, target);
  }
}

void binarySearchIterator(List<int> arr, int target) {
  int start = 0;
  int end = arr.length - 1;
  int mid = 0;
  var stopwatch = Stopwatch()..start();
  while (start <= end) {
    mid = start + (end - start) ~/ 2;

    if (arr[mid] == target) {
      break;
    } else if (target > arr[mid]) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }
  stopwatch.stop();
  if (arr[mid] != target) {
    print('No element found');
  } else {
    print('The element found at index $mid with value ${arr[mid]}');
  }

  print(stopwatch.elapsedMicroseconds);

  int i = 0;
  stopwatch.start();

  for (i; i < arr.length; i++) {
    if (arr[i] == target) {
      break;
    }
  }
  stopwatch.stop();
  if (i < arr.length) {
    print('time = ${stopwatch.elapsedMicroseconds} and value = ${arr[i]}');
  } else {
    print('No element found');
  }
}
