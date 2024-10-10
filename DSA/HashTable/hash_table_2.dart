void main() {
  final HashTable<String, int> table = HashTable<String, int>(10);

  table.add('apple', 10);
  table.add('appel', 50);
  table.add('orange', 20);
  table.add('apple', 500);
  table.add('banana', 30);
  table.add('afnan', 100);
  table.add('majid', 200);
  table.add('ayush', 200);
  print(table);
  print('got: ${table.get('apple')}');
  print('removed: ${table.removeElement('afnan')}');
}

class HashTable<K, V> {
  final List<List<HashNode<K, V>>?> _table;
  int length;

  HashTable(this.length) : _table = List.filled(length, null);

  int _hashIndex(K key) {
    return key.hashCode % length;
  }

  V? removeElement(K key) {
    final index = _hashIndex(key);
    if (_table[index] == null) {
      return null;
    }
    for (var element in _table[index]!) {
      if (element.key == key) {
        final val = element.value;
        _table[index]!.remove(element);
        return val;
      }
    }
    return null;
  }

  ///Get the corresponding Value of the Key if key exist or null returns.
  V? get(K key) {
    final index = _hashIndex(key);
    if (_table[index] == null) {
      return null;
    }
    for (var val in _table[index]!) {
      if (val.key == key) {
        return val.value;
      }
    }
    return null;
  }

  ///Add a key value to the HashTable.
  void add(K key, V value) {
    final HashNode<K, V> newNode = HashNode(key, value);
    final index = _hashIndex(key);
    if (_table[index] == null) {
      _table[index] = [newNode];
    } else if (_table[index]!.any(
      (element) => element.key == key,
    )) {
      for (var val in _table[index]!) {
        if (val.key == key) {
          val.value = value;
          return;
        }
      }
    } else {
      _table[index]!.add(newNode);
    }
  }

  @override
  String toString() {
    StringBuffer str = StringBuffer('[');
    for (var element in _table) {
      if (element == null) {
        str.write('$element, ');
        continue;
      }
      str.write('[');
      for (var val in element) {
        str.write('${val.key} : ${val.value}, ');
      }
      str.write('], ');
    }
    str.write(']');
    return str.toString();
  }
}

class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}
