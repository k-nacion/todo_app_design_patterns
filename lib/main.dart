import 'package:flutter/material.dart';
import 'package:todo_app/screens/homescreen.dart';
import 'package:todo_app/theme.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,

      home: const Homescreen(),
    );
  }
}
