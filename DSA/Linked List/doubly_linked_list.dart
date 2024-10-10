void main() {
  final con = DoublyLinkedList();

  con.addNode(10);
  con.addNode(20);
  con.addNode(30);
  con.displayNormal();
  con.displayReverse();
  con.insertNodeAfter(10, 5);
  con.insertNodeAfter(40, 35);
  con.deleteLastNode();
  con.deleteAt(30);
  con.displayNormal();
}

class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  void deleteAt(int givenData) {
    Node? current = head;

    if (current == null) {
      print('Doubly Linked list is empty');
    } else if (head!.data == givenData) {
      if (head!.next != null) {
        head = head!.next;
        head!.prev = null;
      } else {
        head = null;
        tail = null;
      }
      print('Node $givenData is deleted from head');
    } else if (tail!.data == givenData) {
      print('Node $givenData is deleted form tail');
      tail = tail!.prev;
      tail!.next = null;
    } else {
      while (current != null && current.data != givenData) {
        current = current.next;
      }

      if (current == null) {
        print('Node $givenData is not found to delete');
      } else {
        current.prev!.next = current.next;
        current.next!.prev = current.prev;
        print('Node $givenData is deleted');
      }
    }
  }

  void addNode(int data) {
    final newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      newNode.prev = tail;
      tail!.next = newNode;
    }

    tail = newNode;
  }

  void insertNodeBefore(int givenData, int data) {
    final Node newNode = Node(data);
    Node? current = head;
    if (current == null) {
      print('Doubly Linked list is empty');
      return;
    } else if (current.data == givenData) {
      newNode.next = head;
      head?.prev = newNode;
      head = newNode;
      print('Node $data is added before head ${head!.next!.data}');
      return;
    } else if (tail != null && tail!.data == givenData) {
      tail!.prev!.next = newNode;
      newNode.prev = tail!.prev!.next;
      newNode.next = tail;
      tail!.prev = newNode;
      print('Node $data is added before tail ${tail!.data}');
      return;
    } else {
      while (current != null && current.data != givenData) {
        current = current.next;
      }
      if (current == null) {
        print('Given node $givenData is not found');
      } else {
        current.prev!.next = newNode;
        newNode.prev = current.prev!.next;
        newNode.next = current;
        current.prev = newNode;
        print(
            'Node ${newNode.data} is added between ${current.prev!.data} and ${current.data}');
      }
    }
  }

  void insertNodeAfter(int givenData, int data) {
    final Node newNode = Node(data);
    Node? current = head;

    if (current == null) {
      print('Doubly Linked list is empty');
      return;
    } else if (current.data == givenData) {
      newNode.next = head!.next;
      head!.next!.prev = newNode;
      newNode.prev = head;
      head!.next = newNode;
      print('Node $data is added after head ${head!.data}');
    } else if (tail != null && tail!.data == givenData) {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
      print('Node $data is added after tail ${tail!.prev!.data}');
    } else {
      while (current != null && current.data != givenData) {
        current = current.next;
      }

      if (current == null) {
        print('Given node $givenData is not found');
      } else {
        newNode.next = current.next;
        current.next!.prev = newNode;
        newNode.prev = current;
        current.next = newNode;

        print(
            'Node ${newNode.data} is added between ${current.data} and ${newNode.next!.data}');
      }
    }
  }

  void deleteLastNode() {
    if (head != null && tail != null) {
      if (head!.next != null) {
        print('Node ${tail!.data} is deleted');
        tail = tail!.prev;
        tail!.next = null;
      } else {
        head = null;
        tail = null;
      }
    } else {
      print('Doubly Linked list is empty');
    }
  }

  void displayNormal() {
    Node? current = head;
    if (current == null) {
      print('Doubly Linked list is empty');
      return;
    }
    print('Displaying Normally');
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void displayReverse() {
    Node? current = tail;
    if (current == null) {
      print('Doubly Linked list is empty');
      return;
    }
    print('Displaying Reversely');

    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }
}
