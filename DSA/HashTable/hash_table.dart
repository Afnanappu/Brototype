void main() {
  final MyHashMap<String, dynamic> hashMap = MyHashMap<String, dynamic>(10);



  hashMap.add(HashNode('anshif', 100));
  hashMap.add(HashNode('afnan', 300));
  hashMap.add(HashNode('afnan', [10, 20, 30]));

  hashMap.display();


  print(hashMap.getElement('afnan'));

  print(hashMap.containValue([10, 20, 20]));
}

class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}

class MyHashMap<K, V> {
  late List<List<HashNode<K, V>>?> _hashList;
  final int _length;
  MyHashMap(this._length) {
    _hashList = List.filled(_length, null);
  }

  int _hashIndex(K key) {
    return key.hashCode % _length;
  }

  void add(HashNode<K, V> value) {
    final index = _hashIndex(value.key);
    if (_hashList[index] == null) {
      _hashList[index] = [value];
    } else {
      for (var val in _hashList[index]!) {
        if (val.key == value.key) {
          print(
              'Duplicate key found in `${val.key}`, overriding the current value ${val.value} with ${value.value}');
          val.value = value.value;
          return;
        }
      }
      _hashList[index]!.add(value);
    }
  }

  V? getElement(K key) {
    final list = _hashList[_hashIndex(key)];
    return list
        ?.firstWhere(
          (element) => element.key == key,
        )
        .value;
  }

  K? containValue(V value) {
    for (var element in _hashList) {
      if (element == null) continue;
      for (var val in element) {
        if (val.value == value) {
          return val.key;
        }
      }
    }
    return null;
  }

  void display() {
    // print(_hashList);
    for (var element in _hashList) {
      if (element != null) {
        for (var value in element) {
          print('${value.key} : ${value.value}');
        }
      }
    }
  }
}









// void main() {
//   MyHashSet hashSet = MyHashSet(10);
//   hashSet.add('afnan');
//   hashSet.add('nafil');
//   hashSet.add(50 );
//   hashSet.display();

//   hashSet.add([1, 2, 3]);
//   hashSet.add([1, 2, 3]);
//   hashSet.add({10: 20});

//   hashSet.display();

//   // print(hashSet.contains('nafil'));
//   // print(hashSet.indexOf('afnan'));
// }

// class MyHashSet {
//   final int len;
//   late final List<dynamic> hashSet;

//   MyHashSet(this.len) {
//     hashSet = List.filled(len, null);
//   }

//   int _getIndex(dynamic value) {
//     if (value is String) {
//       int ascii = 0;
//       for (var i = 0; i < value.length; i++) {
//         ascii += value.codeUnitAt(i);
//       }
//       return ascii % len;
//     } else if (value is int || value is double) {
//       return value % len;
//     } else if (value is List || value is Map || value is Set) {
//       return value.length % len;
//     } else {
//       return value.hashCode % len;
//     }
//   }

//   void add(dynamic value) {
//     final index = _getIndex(value);
//     if (hashSet[index] == null) {
//       hashSet[index] = value;
//       print('$value is added at index $index');
//     } else {
//       print('$value have duplicate');


//     }
//   }

//   void display() {
//     print(hashSet);
//   }

//   bool contains(dynamic value) {
//     final str = hashSet[_getIndex(value)];
//     return str == value ? true : false;
//   }

//   int? indexOf(dynamic value) {
//     final int index = _getIndex(value);
//     return hashSet[index] == value ? index : null;
//   }

  
// }


// // class MyHashSet {
// //   final int len;
// //   late final List<int> hashSet;

// //   MyHashSet(this.len) {
// //     hashSet = List.filled(len, 0);
// //   }

// //   void add(int value) {
// //     int index = value % len;
// //     hashSet[index] = value;
// //     print("$value is added in $index");
// //   }

// //   void display() {
// //     print(hashSet);
// //     StringBuffer str = StringBuffer();
// //     for (var element in hashSet) {
// //       if (element != 0) {
// //         str.write(" $element");
// //       }
// //     }
// //     print(str);
// //   }

// //   void remove(int value) {
// //     int index = value % len;
// //     hashSet[index] = 0;
// //     print('$value is deleted from $index');
// //   }
// // }
