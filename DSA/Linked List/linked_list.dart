import 'dart:io';

void main() {
  final list = SLinkedList();
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(50);
  list.display();
  list.insertAt(4, 40);
  list.add(60);
  list.display();
}

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class SLinkedList {
  Node? head;
  Node? tail;

  void insertAt(int index, int data) {
    Node? current = head;
    int count = 0;

    if (head == null) {
      return;
    }
    final newNode = Node(data);
    if (index == 0) {
      newNode.next = head;
      head = newNode;
      print('Node is added');
    }

    while (current != null && count != index - 1) {
      current = current.next;
      count++;
    }

    if (current != null) {
      newNode.next = current.next;
      current.next = newNode;
      if (current == tail) {
        tail = newNode;
      }
      print('Node is added');
    } else {
      print('Node not found');
    }
  }

  void findMiddleOfLinkedList() {
    Node? slow = head;
    Node? fast = head;

    while (fast?.next != null) {
      slow = slow!.next;
      fast = fast!.next?.next;
    }

    print('Middle value of this linked list: ${slow?.data}');
  }

  ///You can Insert Node before the [givenData]
  void insertBefore(int givenData, int data) {
    final Node? newNode = Node(data);
    if (head != null && head!.data == givenData) {
      newNode!.next = head;
      head = newNode;
    } else {
      Node? current = head;

      while (current!.next != null && current.next!.data != givenData) {
        current = current.next;
      }

      if (current.next != null) {
        newNode!.next = current.next;
        current.next = newNode;
      } else {
        print('No node find with givenData');
      }
    }
  }

  void reverseLinkedList() {
    if (head != null && head?.next != null) {
      Node? current = head;
      Node? prev = null, next = current!.next;

      while (current != null) {
        current.next = prev;
        prev = current;
        current = next;
        next = next?.next;
      }

      head = tail;
      tail = prev;
    }
  }

  void sort() {
    Node? currentA = head;
    Node? currentB = currentA?.next;

    while (currentA != null) {
      while (currentB != null) {
        if (currentA.data > currentB.data) {
          int temp = currentB.data;
          currentB.data = currentA.data;
          currentA.data = temp;
        }
        currentB = currentB.next;
      }
      currentA = currentA.next;
      currentB = currentA?.next;
    }
  }

  void removeDuplicateFromLinkedList() {
    Node? current = head;

    if (current == null) {
      return;
    }
    while (current!.next != null) {
      if (current.data == current.next!.data) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }

  void insert(int givenData, int data) {
    final Node newNode = Node(data);
    if (head != null && head!.data == givenData) {
      newNode.next = head!.next;
      head!.next = newNode;
      print('Inserted $data between head $givenData and ${newNode.next?.data}');
    } else if (tail != null && tail!.data == givenData) {
      tail!.next = newNode;
      tail = newNode;
      print('New node $data is added in tail $givenData');
    } else {
      Node? current = head;
      while (current != null && current.data != givenData) {
        current = current.next;
      }

      if (current != null) {
        newNode.next = current.next;
        current.next = newNode;
        print(
            'Node $data is added between $givenData and ${newNode.next!.data}');
      } else {
        print('No node found to add');
      }
    }
  }

  void delete(int data) {
    if (head != null && head!.data == data) {
      head = head!.next;
      if (head == null) {
        tail = null;
      }
      print('Deleted from head $data');
    } else {
      Node? current = head;
      Node? prev = null;

      while (current != null && current.data != data) {
        prev = current;
        current = current.next;
      }

      if (current != null) {
        prev!.next = current.next;
        if (current == tail) {
          tail = prev;
          print('Deleted from tail $data');
          return;
        }
        print('Deleted from $data');
      } else {
        print('No node found to delete');
      }
    }
  }

  /// Adds a new node with the given [data] to the end of the linked list.
  ///
  /// If the list is empty, the new node becomes both the head and tail.
  /// Otherwise, it's added after the current tail and becomes the new tail.
  ///
  /// Example:
  /// ```dart
  /// final list = SLinkedList();
  /// list.add(10);
  /// list.add(20);
  /// ```
  void add(int data) {
    final Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    Node? current = head;
    print('Displaying Linked list');
    while (current != null) {
      stdout.write("${current.data}, ");
      current = current.next;
    }
    print('');
  }
}
