void main() {
  // changeToLast([6, 1, 6, 2, 5, 7, 6, 5, 8, 9, 6, 6, 6], 6);
  mergeTwoSortedArray([1, 7, 9,10,12,16,40], [2, 4, 6, 8, 11,13,15,20,100, 105]);
}

void mergeTwoSortedArray(List<int> arr1, List<int> arr2) {
  List<int> newArr = [];
  int i = 0;
  int j = 0;
  print('arr1: $arr1\narr2: $arr2');

  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      newArr.add(arr1[i]);
      i++;
    } else {
      newArr.add(arr2[j]);
      j++;
    }
  }
  while (i < arr1.length) {
    newArr.add(arr1[i]);
    i++;
  }

  while (j < arr2.length) {
    newArr.add(arr2[j]);
    j++;
  }
  print(newArr);
}

void changeToLast(List<int> arr, int number) {
  int j = arr.length - 1;
  int i = 0;
  print('Before changing: $arr');

  while (i < j) {
    while (j > i && arr[j] == number) {
      j--;
    }

    if (arr[i] == number) {
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
    i++;
  }

  print('After changing: $arr');
}
