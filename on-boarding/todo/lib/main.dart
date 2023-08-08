import 'package:flutter/material.dart';
import 'package:todo/Screens/task_detail.dart';
import 'package:todo/Screens/todo_list.dart';

import 'Screens/add_task.dart';
import 'Screens/getting_started.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const GetStarted(),
        '/todoList': (context) => TodoList(),
        '/addTask': (context) => AddTask(),
        '/taskDetail': (context) => const TaskDetail(),
      },
    );
  }
}
