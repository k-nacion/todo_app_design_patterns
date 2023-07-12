import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({
    this.todo,
    super.key,
  });

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      floatingActionButton: _createFab(),
      body: _createBody(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text(todo != null ? 'Edit Todo' : 'Add Todo'),
      centerTitle: true,
    );
  }

  Widget _createFab() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  Widget _createBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          TextFormField(decoration: const InputDecoration(hintText: 'What needs to be done? ')),
          SizedBox(height: 24),
          TextFormField(
            maxLines: 8,
            decoration: const InputDecoration(hintText: 'Additional Notes...'),
          )
        ],
      ),
    );
  }
}
