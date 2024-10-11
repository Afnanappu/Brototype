
void main() {
  // final queue = QueueUsingStack<int>();
  // queue.enqueue(10);
  // queue.enqueue(20);
  // queue.enqueue(30);
  // queue.display();
  // queue.dequeue();
  // queue.display();
  // queue.enqueue(40);
  // queue.display();

  final stack = StackUsingQueue<int>();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.display();
  stack.pop();
  stack.pop();
  stack.display();
  stack.push(20);
  stack.push(30);
  stack.display();
}

class StackUsingQueue<T> {
  var queue1 = <T>[];
  var queue2 = <T>[];

  void push(T value) {
    queue1.add(value);
  }

  void pop() {
    if (queue1.isEmpty) {
      print('Stack is empty');
      return;
    }

    while (queue1.length > 1) {
      queue2.add(queue1.removeAt(0));
    }

    queue1.removeLast();

    List<T> temp = queue1;
    queue1 = queue2;
    queue2 = temp;
  }

  void display() {
    if (queue1.isEmpty) print('Stack is empty');
    print(queue1);
  }
}

class QueueUsingStack<T> {
  final List<T> stack1 = [];
  final List<T> stack2 = [];

  void enqueue(T value) {
    stack1.add(value);
  }

  void dequeue() {
    if (stack2.isEmpty) {
      while (stack1.isNotEmpty) {
        stack2.add(stack1.removeLast());
      }
    }

    if (stack2.isNotEmpty) {
      stack2.removeLast();
    }
  }

  void display() {
    print([
      ...stack2.reversed,
      ...stack1,
    ]);
  }
}

class HashTable<K, V> {
  final List<List<HashNode<K, V>>> table;
  int length;
  HashTable(this.length) : table = List.generate(length, (_) => []);

  int hashIndex(K key) {
    return key.hashCode % length;
  }

  void remove(K key) {
    int index = hashIndex(key);
    table[index].removeWhere(
      (element) => element.key == key,
    );
  }

  void add(K key, V value) {
    final newNode = HashNode<K, V>(key, value);
    int index = hashIndex(key);
    for (var element in table[index]) {
      if (element.key == key) {
        element.value = value;
        return;
      }
    }
    table[index].add(newNode);
  }

  V? get(K key) {
    int index = hashIndex(key);
    for (var element in table[index]) {
      if (element.key == key) {
        return element.value;
      }
    }
    return null;
  }

  void display() {
    for (var element in table) {
      if (element.isNotEmpty) {
        for (var node in element) {
          print('${node.key} : ${node.value}');
        }
      }
    }
  }
}

class HashNode<K, V> {
  K key;
  V value;
  HashNode(this.key, this.value);
}

class Stack<T> {
  final List<T> stack = [];
  int length = 0;

  void removeMiddle() {
    _removeMidleHelper(length ~/ 2);
  }

  void _removeMidleHelper(int current) {
    if (stack.isEmpty) {
      return;
    }
    if (current == 0) {
      pop();
      return;
    }

    T valeu = pop()!;
    _removeMidleHelper(current - 1);
    push(valeu);
  }

  void push(T value) {
    stack.add(value);
    length++;
  }

  void display() {
    if (stack.isEmpty) {
      return;
    }
    print(stack);
  }

  T? pop() {
    if (stack.isEmpty) {
      print('Stack is empty');
      return null;
    }
    length--;
    return stack.removeLast();
  }

  T? get peek => stack.lastOrNull;

  bool get isEmpty => stack.isEmpty;
}

class Queue<T> {
  final List<T> queue = [];
  int length = 0;

  void enqueue(T data) {
    queue.add(data);
  }

  void display() {
    if (queue.isEmpty) {
      print('queue is empty');
      return;
    }
    print(queue);
  }

  T? dequeue() {
    if (queue.isEmpty) {
      print('Queue is empty');
      return null;
    }
    return queue.removeAt(0);
  }

  bool get isEmpty => queue.isEmpty;

  T? get peek => queue.firstOrNull;
}
