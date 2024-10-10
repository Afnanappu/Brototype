void main() {
  List<int> arr = [1, 5, 4, 6, 8, 7, 9, 2, 5, 9, 5];
  print('Given array: $arr');
}

void removeSpecificValueFromArray(List<int> arr, int value) {
  List<int> newArray = arr
      .where(
        (element) => element != value,
      )
      .toList();

  print(newArray);
}

void sortArray(List<int> arr) {
  if (arr.length < 2) {
    print('After sorting : $arr');
    return;
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

  print(mergeSort(arr));
}

void findTheIntersectionOfTwoArray(List<int> arr1, List<int> arr2) {
  print(arr1.toSet().intersection(arr2.toSet()));
}

void mergeTwoArray(List<int> arr1, List<int> arr2) {
  print(arr1 + arr2);
}

void rotateArray(List<int> arr, int steps) {
  int n = arr.length;
  steps = steps % n;
  if (steps == 0) {
    print('array after rotating $steps steps: $arr');
    return;
  }

  List<int> rotatedArray = arr.sublist(n - steps) + arr.sublist(0, n - steps);

  // for (int i = 0; i < steps; i++) {
  //   arr.insert(0, arr.removeLast());
  // }
  print('array after rotating $steps steps: $rotatedArray');
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

void checkForDuplicate(List<int> arr) {
  Set<int> set = {};

  for (int i = 0; i < arr.length; i++) {
    if (!set.add(arr[i])) {
      print('True');
      return;
    }
  }
  print('false');
}

void findTheSumOfNumbers(List<int> arr) {
  if (arr.isEmpty) {
    print('Array is empty, sum is 0');
    return;
  }
  int sum = arr.reduce(
    (previousValue, element) => previousValue + element,
  );
  print('The sum of all element is $sum');
}

void findTheMaxNumber(List<int> arr) {
  if (arr.isEmpty) {
    print('empty');
    return;
  }
  int max = arr.reduce(
    (value, element) => value < element ? element : value,
  );

  print('Max element in the given array = $max');
}

void reverseAnArray(List<int> arr) {
  int currentIndex = 0;
  int len = arr.length - 1;
  while (currentIndex < (len / 2)) {
    int temp = arr[currentIndex];
    arr[currentIndex] = arr[len - currentIndex];
    arr[len - currentIndex] = temp;

    currentIndex++;
  }

  print('Reversed array: $arr');
}
