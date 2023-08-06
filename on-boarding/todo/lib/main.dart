import 'package:flutter/material.dart';
import 'package:todo/Screens/task_detail.dart';

import 'Screens/add_task.dart';
import 'Screens/getting_started.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GetStarted(),
      // home: AddTask(),
      home: TaskDetail(),
    );
  }
}
