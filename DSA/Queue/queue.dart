import 'dart:io';
void main() {
  final Queue<int> queue = Queue<int>();

  // queue.display();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.display();
  queue.dequeue();
  queue.dequeue();
  queue.dequeue();
  queue.display();
  print(queue.peek);
}

class QueNode<T> {
  T data;
  QueNode<T>? next;
  QueNode(this.data);
}

class Queue<T> {
  QueNode<T>? front, rear;

  T? get peek => front?.data;

  void enqueue(T data) {
    final newNode = QueNode(data);
    if (front == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  T? dequeue() {
    final data = front!.data;
    front = front!.next;
    return data;
  }

  void display() {
    if (front == null) {
      print('Queue is empty');
      return;
    }

    QueNode<T>? current = front;
    while (current != null) {
      stdout.write(' ${current.data} ');
      current = current.next;
    }
    print('');
  }
}
