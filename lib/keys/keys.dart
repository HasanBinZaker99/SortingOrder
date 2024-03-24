import 'package:flutter/material.dart';

import 'package:key_setup_app/keys/checkable_todo_item.dart';

//import 'package:key_setup_app/keys/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;

  @override
  String toString() => 'Todo{text: $text,priority:$priority}';
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _keysState();
  }
}

class _keysState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'A Flutter',
      Priority.urgent,
    ),
    const Todo(
      'B Flutter',
      Priority.normal,
    ),
    const Todo(
      'C other courses',
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    print('sortedTodos:$sortedTodos');
    // We then sort this copied list.
    sortedTodos.sort((a, b) {
      // We compare the text of the two Todo items.
      // compareTo is a method that compares two Strings and returns an integer.
      // If a is before b in alphabetical order, it returns a negative number.
      // If a is after b, it returns a positive number.
      // If a and b are the same, it returns zero.
      int comparisonResult = a.text.compareTo(b.text);
      // If the order is ascending ('asc'), we return the comparison result as is.
      // If the order is descending ('desc'), we return the negated result
      // to reverse the order of the sort.
      return _order == 'asc' ? comparisonResult : -comparisonResult;
    });
    // Finally, we return the sorted list.
    return sortedTodos;
    // final sortedTodos = List.of(_todos);
    // sortedTodos.sort((a, b) {
    //   final bComesAfterA = a.text.compareTo(b.text);
    //   return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    // });
    // return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
                _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
            label: Text('Sort ${_order == 'asc' ? 'Ascending' : 'Descending'}'),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            for (final todo in _orderedTodos)
              CheckableTodoItem(
                key: ObjectKey(todo),
                todo.text,
                todo.priority,
              )
          ],
        ))
      ],
    );
  }
}
