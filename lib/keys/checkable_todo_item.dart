import 'package:flutter/material.dart';

// enum Priority { urgent, normal, low }
enum Priority {
  low,
  normal,
  urgent;

  @override
  String toString() {
    return this
        .name; // Assuming Dart 2.15 or higher, this will return the enum value name.
  }
}

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckableTodoItem> createState() => _chekableTodoItemState();
}

class _chekableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (widget.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: _done, onChanged: _setDone),
          Icon(icon),
          const SizedBox(
            width: 12,
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
