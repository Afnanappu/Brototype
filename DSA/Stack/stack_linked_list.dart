void main() {
  final StackLinkedList<int> stack = StackLinkedList<int>();

  stack.push(10);
  stack.push(20);
  stack.push(30);
  print(stack.peek);
  stack.display();
  print(stack.pop());
  stack.display();
  print(stack.peek);
}

class StackLinkedList<E> {
  StackNode<E>? top;

  ///Get the top element form the stack.
  E? get peek => top?.data;

  ///Push element [value] to the stack.
  void push(E value) {
    final newNode = StackNode<E>(value);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  ///Remove the top element form the stack and return [value]
  E? pop() {
    if (top == null) {
      return null;
    }
    var val = top!.data;
    top = top?.next;
    return val;
  }

  ///Display every element in the stack
  void display() {
    if (top == null) {
      return;
    }
    print('\n-----Top-----');
    StackNode? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
    print('-----End-----');
  }
}

class StackNode<E> {
  E data;
  StackNode<E>? next;
  StackNode(this.data);
}
