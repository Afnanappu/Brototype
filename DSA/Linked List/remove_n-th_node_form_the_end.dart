import 'dart:io';

void main() {
  SLinkedList list = SLinkedList();
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);
  list.add(50);
  list.display();
  print(list.length);
  list.removeNthNodeFromTheEnd(5);
  print(list.length);

}

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class SLinkedList {
  Node? head;
  Node? tail;
  int _length = 0;

  int get length => _length;

  void removeNthNodeFromTheEnd(int n) {
    if (head == null) {
      print('linked list is empty');
      return;
    }
    if (n == _length) {
      head = head!.next;
      _length--;
      display();
      return;
    }
    if (n > _length || n <= 0) {
      print('Invalid node position.');
      return;
    }
    Node? nthNode = head;
    Node? current = head;

    for (int i = 0; i < n; i++) {
      nthNode = nthNode?.next;
      if (nthNode == null) break;
    }

    while (nthNode?.next != null) {
      nthNode = nthNode?.next;
      current = current?.next;
    }

    current?.next = current.next?.next;
    _length--;
    display();
  }

  void add(int data) {
    final newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
    _length++;
  }

  void display() {
    Node? current = head;
    while (current != null) {
      stdout.write('${current.data}, ');
      current = current.next;
    }
    print('');
  }
}
