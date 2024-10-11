void main() {
  final Stack<int> stack = Stack<int>();

  stack.push(10);
  stack.push(20);
  stack.push(30);
  print(stack.peek);
  print(stack);
  print(stack.pop());
  print(stack);
  print(stack.peek);
}

class Stack<E> {
  ///This constructor will create a stack with the given type.
  Stack() : _stack = <E>[];

  ///This constructor will create a stack form a Iterable to stack.
  Stack.of(Iterable<E> value) : _stack = List.of(value);

  final List<E> _stack;

  bool balanceTheParentheses(String str) {
    for (var i = 0; i < str.length; i++) {
      if (str[i] == '(') {
        push(str[i] as E);
      } else if (str[i] == ')') {
        if (isNotEmpty) pop();
      }
    }
    if (_stack.isEmpty) {
      return true;
    }
    return false;
  }

  void displayListInReverse(List<E> arr) {
    for (var element in arr) {
      push(element);
    }
    while (_stack.isNotEmpty) {
      print(pop());
    }
  }

  ///Get the top element from the stack.
  E? get peek => _stack.lastOrNull;

  ///Check if stack is empty
  ///return [true] if empty else [false].
  bool get isEmpty => _stack.isEmpty;

  ///Check if stack is empty
  ///return [false] if empty else [true].
  bool get isNotEmpty => _stack.isNotEmpty;

  ///Push element [value] to the stack.
  void push(E value) {
    _stack.add(value);
  }

  ///Remove the top element form the stack and return [value]
  E pop() {
    return _stack.removeLast();
  }

  @override
  String toString() {
    return '\n-------Top-------\n${_stack.reversed.join('\n')}\n-------End-------\n';
  }
}
