import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/todo_detail_screen.dart';

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
      key: ValueKey<String>(todo.id),
      onDismissed: (direction) => dismissibleOnDismissed(direction, todo),
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute<TodoDetailScreen>(
          builder: (context) => TodoDetailScreen(
            todo: todo,
          ),
        )),
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) => checkboxOnChange(value, todo),
        ),
        title: Text(
          todo.title,
          style: todo.isCompleted ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
        ),
        subtitle: Text(
          todo.shortDesc ?? '',
          style: todo.isCompleted ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
        ),
      ),
    );
  }
}
