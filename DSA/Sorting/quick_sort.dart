// void main() {
//   List<int> arr = [64, 34, 25, 12, 22, 11, 90];
//   print('Original array: $arr');

//   quickSort(arr, 0, arr.length - 1);
//   print('After sort array: $arr');
// }

// void quickSort(List<int> arr, int start, int end) {
//   if (start >= end) {
//     return;
//   }

//   int pivInd = partitionForQuickSort(arr, start, end);
//   quickSort(arr, start, pivInd - 1);
//   quickSort(arr, pivInd + 1, end);
// }

// int partitionForQuickSort(List<int> arr, int start, int end) {
//   int pv = arr[start];
//   int left = start + 1;
//   int right = end;

//   void swap(List<int> arr, int i, int j) {
//     int temp = arr[i];
//     arr[i] = arr[j];
//     arr[j] = temp;
//   }

//   while (left <= right) {
//     while (arr[left] < pv) {
//       left++;
//     }
//     while (arr[right] > pv) {
//       right--;
//     }
//     if (left < right) {
//       swap(arr, left, right);
//     }
//   }

//   swap(arr, start, right);

//   return right;
// }


//This wil also work
//
void main() {
  List<int> list = [11, 55, 0, 6, 8, 7, 6, 45, 30];
  print('Array before: $list');
  List<int> arr = quickSort(list);
  print('Array after: $arr');
}

List<int> quickSort(List<int> arr) {

  _quickSortHelper(arr, 0, arr.length - 1);
  return arr;
}

void _quickSortHelper(List<int> arr, int start, int end) {
  if (start >= end) {
    return;
  }
  
  int pvt = _partitionForQuickSort(arr, start, end);

  _quickSortHelper(arr, start, pvt - 1);
  _quickSortHelper(arr, pvt + 1, end);
}

void _swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

int _partitionForQuickSort(List<int> arr, int start, int end) {
  int pv = arr[start];
  int left = start + 1;
  int right = end;

  while (left <= right) {
    while (left <= right && arr[left] < pv) {
      left++;
    }
    while (left <= right && arr[right] > pv) {
      right--;
    }
    if (left <= right) {
      _swap(arr, left, right);
      left++;
      right--;
    }
  }
  _swap(arr, start, right);
  return right;
}
