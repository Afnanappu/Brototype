void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  print('Original array: $arr');
  quickSort(arr);
  print('After sorted array: $arr');
  // print('After sorted array: ${mergeSort(arr)}');
}

//----------------mergeSort----------------//

List<int> _sort(List<int> left, List<int> right) {
  int i = 0, j = 0;
  final newList = <int>[];
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      newList.add(left[i]);
      i++;
    } else {
      newList.add(right[j]);
      j++;
    }
  }

  newList.addAll(left.sublist(i));
  newList.addAll(right.sublist(j));

  return newList;
}

List<int> mergeSort(List<int> arr) {
  if (arr.length < 2) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  final left = mergeSort(arr.sublist(0, mid));
  final right = mergeSort(arr.sublist(mid));

  return _sort(left, right);
}

//----------------quickSort----------------//

void quickSort(List<int> arr) {
  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  int _partition(List<int> arr, int start, int end) {
    int pv = start;
    int left = start + 1;
    int right = end;

    while (left <= right) {
      while (left <= right && arr[left] < arr[pv]) left++;
      while (left <= right && arr[right] > arr[pv]) right--;

      if (left <= right) swap(arr, left, right);
    }
    swap(arr, start, right);

    return right;
  }

  void _sort(List<int> arr, int start, int end) {
    if (start >= end) {
      return;
    }

    int pvt = _partition(arr, start, end);
    _sort(arr, start, pvt - 1);
    _sort(arr, pvt + 1, end);
  }

  _sort(arr, 0, arr.length - 1);
}

//----------------insertionSort----------------//

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

//----------------bubbleSort----------------//

void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

//----------------selectionSort----------------//

void selectionSort(List<int> arr) {
  int len = arr.length;
  for (int i = 0; i < len - 1; i++) {
    int small = i;
    for (int j = i + 1; j < len; j++) {
      if (arr[j] < arr[small]) {
        small = j;
      }
    }
    if (small != i) {
      int temp = arr[i];
      arr[i] = arr[small];
      arr[small] = temp;
    }
  }
}
