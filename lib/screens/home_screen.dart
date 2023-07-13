import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_list_item.dart';

part 'home_screen_tab_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenState homeScreenState = HomeScreenState.loading;
  final todoList = <Todo>[];
  int currentPageIndex = 0;

  Future<void> fetchData() async {
    setState(() {
      homeScreenState = HomeScreenState.loading;
    });

    final jsonString = await rootBundle.loadString('assets/fixture.json');
    final jsonDecoded = jsonDecode(jsonString);
    final todos = jsonDecoded['todos'] as List<dynamic>;

    for (final t in todos) {
      final title = t['title'] as String;
      final shortDesc = t['short_desc'] as String;
      final created = DateTime.parse(t['created'] as String);
      final lastUpdated = DateTime.parse(t['last_updated'] as String);

      final todo = Todo(
        title: title,
        shortDesc: shortDesc,
        created: created,
        lastUpdated: lastUpdated,
      );

      todoList.add(todo);
    }

    setState(() {
      homeScreenState = HomeScreenState.success;
    });
  }

  void _checkBoxOnChanged(bool? value, Todo todo) {
    setState(() {
      final todoIndex = todoList.indexOf(todo);
      final todoReplacement = todo.copyWith(isCompleted: value);
      todoList[todoIndex] = todoReplacement;
    });
  }

  void _dismissibleOnDismissed(DismissDirection dismissDirection, Todo todo) {
    setState(() {
      todoList.remove(todo);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          todo.title,
          overflow: TextOverflow.ellipsis,
        ),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              todoList.add(todo);
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      floatingActionButton: _createFloatingActionButton(),
      bottomNavigationBar: _createBottomNavigationBar(),
      body: _createBody(),
    );
  }

  Widget _createBottomNavigationBar() {
    return NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: (value) => setState(() {
        currentPageIndex = value;
      }),
      destinations: const <NavigationDestination>[
        NavigationDestination(icon: Icon(Icons.list), label: 'Todos'),
        NavigationDestination(icon: Icon(Icons.show_chart), label: 'Stats'),
      ],
    );
  }

  Widget _createBody() {
    return <Widget>[
      _todoPage,
      _statPage,
    ][currentPageIndex];
  }

  Widget get _todoPage {
    switch (homeScreenState) {
      case HomeScreenState.loading:
        return const Center(child: CircularProgressIndicator.adaptive());
      case HomeScreenState.error:
        return const Center(child: Text('An error occurred during fetching data...'));
      case HomeScreenState.success:
        return ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];

            return TodoListItem(
              todo: todo,
              checkboxOnChange: _checkBoxOnChanged,
              dismissibleOnDismissed: _dismissibleOnDismissed,
            );
          },
        );
    }
  }

  Widget get _statPage => const Center(child: Text('Our developers is already on it...'));
}

AppBar _createAppBar() {
  return AppBar(
    title: const Text('Vanilla Example'),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    ],
  );
}

Widget _createFloatingActionButton() {
  return FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add));
}
