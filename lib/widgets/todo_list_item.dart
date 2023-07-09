import 'package:flutter/material.dart';

import 'package:todo_app/model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.todo,
    this.onCompletion,
    super.key,
  });

  final Todo todo;
  final void Function()? onCompletion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (bool? value) => onCompletion?.call(),
      ),
      title: Text(todo.title),
      subtitle: Text(todo.shortDesc),
    );
  }
}
