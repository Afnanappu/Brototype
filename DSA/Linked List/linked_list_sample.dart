
void main() {
  final NodeController con1 = NodeController();
  final NodeController con2 = NodeController();

  // List<int> arr = [10, 5, 80, 65, 74, 25, 3, 6, 9, 7, 0, 45];

  con1.addNode(10);
  con1.addNode(20);
  con1.addNode(30);
  print(con1);
  // con1.addNode(40);
  // con1.addNode(50);
  // con1.addNode(60);
  // con1.addNode(70);
  // con1.addNode(80);
  // con1.addNode(90);
  // con1.display();

  // con2.addNode(20);
  // con2.addNode(30);
  // con2.addNode(45);
  // con2.addNode(60);
  // con2.addNode(70);
  // con2.addNode(75);
  // con2.addNode(80);
  // con2.addNode(90);
  // con2.addNode(105);
  // con2.addNode(120);
  // con2.addNode(200);
  // con2.display();

  mergeTwoSortedLinkedList(con1, con2);
}

void mergeTwoSortedLinkedList(NodeController con1, NodeController con2) {
  NodeController newCon = NodeController();
  Node? current1 = con1.head;
  Node? current2 = con2.head;
  // int temp;

  while (current1 != null && current2 != null) {
    if (current1.data > current2.data) {
      newCon.addNode(current2.data);
      current2 = current2.next;
    } else {
      newCon.addNode(current1.data);
      current1 = current1.next;
    }
  }

  while (current1 != null) {
    newCon.addNode(current1.data);
    current1 = current1.next;
  }
  while (current2 != null) {
    newCon.addNode(current2.data);
    current2 = current2.next;
  }

  newCon.display();
}

void sortLinkedList(NodeController con1) {
  Node? current = con1.head;
  Node? index = null;
  int temp = 0;
  int count = 0;

  while (current != null) {
    index = current.next;
    while (index != null) {
      if (current.data > index.data) {
        temp = index.data;
        index.data = current.data;
        current.data = temp;
      }
      count++;
      index = index.next;
    }
    current = current.next;
  }

  print(count);
  con1.display();
}

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class NodeController {
  Node? head = null, tail = null;

  @override
  String toString() {
    return 'Head: ${head?.data}\nTail: ${tail?.data}';
  }

  void addNode(int data) {
    final Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void deleteNode(int data) {
    Node? current = head;
    if (current == null) {
      print('Linked list is empty');
    } else {
      if (current.data == data) {
        head = current.next;
        print('The node with data $data is deleted from head');
        return;
      }
      Node? prevNode = null;
      while (current != null && current.data != data) {
        prevNode = current;
        current = current.next;
      }
      if (current != null) {
        if (current == tail) {
          tail = prevNode;
          tail!.next = null;
          print('The node with data $data is deleted after ${prevNode!.data}');
          return;
        }
        prevNode!.next = current.next;
        print('The node with data $data is deleted after ${prevNode.data}');
      } else {
        print('Node does not exist');
      }
    }
  }

  void insertNodeAfter(int data, int givenData) {
    Node? current = head;
    final Node newNode = Node(data);

    if (current == null) {
      print('Linked list is empty');
    } else {
      while (current != null && current.data != givenData) {
        current = current.next;
      }

      if (current != null) {
        newNode.next = current.next;
        current.next = newNode;
        if (current == tail) {
          tail = newNode;
        }
      } else {
        print('No position to insert');
      }
      print('Node ${newNode.data} inserted after ${current!.data}');
    }

    // if (current == null) {
    //   print('Linked list is empty');
    // } else if (current.data == givenData) {
    //   newNode.next = current.next;
    //   current.next = newNode;
    //   // tail = newNode;
    //   print('New node is inserted after head ${current.data}');
    // } else if (tail!.data == givenData) {
    //   tail!.next = newNode;
    //   tail = newNode;
    //   print('New node is inserted after tail ${tail!.data}');
    // } else {
    //   while (current != null && current.data != givenData) {
    //     current = current.next;
    //   }

    //   if (current == null) {
    //     print('No position to insert');
    //   } else {
    //     newNode.next = current.next;
    //     current.next = newNode;
    //     print('New node is inserted after ${current.data}');
    //   }
    // }
  }

  void insertNodeBefore(int currentData, int data) {
    final Node newNode = Node(data);
    Node? current = head;

    if (current == null) {
      print('Linked list is empty');
    } else if (current.data == currentData) {
      newNode.next = current;
      head = newNode;
      print('Node is added before head');
    } else {
      Node? prev = null;

      while (current?.next != null && current?.data != currentData) {
        prev = current;
        current = current?.next;
      }

      if (current != null && current.data == currentData) {
        newNode.next = current;
        prev!.next = newNode;
        print(
            'Node is added before ${current.data} and after ${prev.data} and the data is $data');
      } else {
        print('No value found to insert');
      }
    }
  }

  void display() {
    Node? current = head;
    if (current == null) {
      print('Node is empty');
    } else {
      print('Started');
      while (current != null) {
        print(current.data);
        current = current.next;
      }
      print('Finished');
    }
  }

  void reverseNodes() {
    Node? current = head;
    Node? next = null, prev = null;
    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
    print('Linked list are set to reverse');
  }

  void removeDuplicatesNode() {
    Node? current = head;

    while (current?.next != null) {
      if (current!.data == current.next!.data) {
        current.next = current.next?.next;
        print('Duplicate founded on ${current.data}');
      } else {
        current = current.next;
      }
    }
    display();
  }

  void convertListToLinkedList(List<int> arr) {
    for (var element in arr) {
      addNode(element);
    }
    display();
  }

  void findMiddleOfLikedList() {
    if (head == null) {
      return;
    }
    if (head!.next == null) {
      print(head!.data);
      return;
    } else if (head!.next!.next == null) {
      print(head!.next!.data);
      return;
    }
    Node? slow = head, fast = head;
    int count = 0;

    while (fast != null && fast.next != null) {
      fast = fast.next!.next;
      slow = slow!.next;
      count++;
    }
    if (count.isEven) {
      print('No middle node for Even Linked list');
    } else {
      print(count + 1);
      print(slow!.data);
    }
  }

  void remove(int currentData) {
    Node? current = head;

    if (current == null) {
      print('Empty linked list');
      return;
    } else if (current.data == currentData) {
      head = current.next;
      print('Removed node $currentData from head');
      return;
    } else {
      Node? prev = null;

      while (current != null && current.data != currentData) {
        prev = current;
        current = current.next;
      }

      if (current == null) {
        print('No element found with given data $currentData');
        return;
      } else {
        if (current == tail) {
          prev!.next = null;
          tail = prev;
          print('Node $currentData from the tail is deleted');
          return;
        }
        prev!.next = current.next;
        print('Node $currentData is deleted');
      }
    }
  }

  void sortLinkedList() {
    Node? current = head;
    Node? matchedNode;
    print('Sorting started');
    while (current != null) {
      matchedNode = current.next;
      while (matchedNode != null) {
        if (current.data > matchedNode.data) {
          print('${current.data} < ${matchedNode.data}');
          int temp = matchedNode.data;
          matchedNode.data = current.data;
          current.data = temp;
        }
        matchedNode = matchedNode.next;
      }
      current = current.next;
    }
    print('Sorting ended');
    // print(head!.data);
    // print(tail!.data);
  }
}
