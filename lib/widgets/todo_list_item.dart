import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.todo,
    required this.checkboxOnChange,
    required this.dismissibleOnDismissed,
    super.key,
  });

  final Todo todo;
  final void Function(bool? val, Todo todo) checkboxOnChange;
  final void Function(DismissDirection dismissDirection, Todo todo) dismissibleOnDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<Todo>(todo),
      onDismissed: (direction) => dismissibleOnDismissed(direction, todo),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) => checkboxOnChange(value, todo),
        ),
        title: Text(todo.title),
        subtitle: Text(todo.shortDesc ?? ''),
      ),
    );
  }
}
