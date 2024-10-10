import 'dart:io';

void main() {
  SLinkedList list = SLinkedList();
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);
  list.add(50);
  list.display();

  SLinkedList list2 = SLinkedList();
  list2.add(10);
  list2.add(20);
  list2.add(30);
  list2.add(40);
  list2.add(50);
  list2.display();

  // SLinkedList list3 = SLinkedList();
}

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class SLinkedList {
  Node? _head;
  Node? _tail;
  int _length = 0;

  Node? get head => _head;

  // void mergeTwoSortedLinkedList(Node head1, Node head2, Node? head3) {
  //   Node? current1 = head1, current2 = head2;

  //   void add(int data) {
  //     final newNode = Node(data);
  //     if(newNode == null){

  //     }
  //   }

  //   while (current1 != null && current2 != null) {
  //     if (current1.data < current2.data) {}
  //   }
  // }

  ///Get the current length of this linked list.
  int get length => _length;

  ///add node to the last of the linked list.
  void add(int data) {
    final newNode = Node(data);
    if (_head == null) {
      _head = newNode;
    } else {
      _tail!.next = newNode;
    }
    _tail = newNode;
    _length++;
  }

  ///To display every data in a Linked list.
  void display() {
    Node? current = _head;
    while (current != null) {
      stdout.write('${current.data}, ');
      current = current.next;
    }
    print('');
  }
}
