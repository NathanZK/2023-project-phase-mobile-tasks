import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:todo/Screens/add_task.dart';
import 'package:todo/Screens/todo_list.dart';
import 'package:todo/main.dart';

navigateToAddTask(tester) async {
  final getStartedButton = find.byType(ElevatedButton);
  await tester.tap(getStartedButton);
  await tester.pumpAndSettle();
  final createTaskButton = find.byType(ElevatedButton);
  await tester.tap(createTaskButton);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
    'Add task UI elements and functionaity work correctly',
    (tester) async {
      await tester.pumpWidget(const TodoApp());
      await navigateToAddTask(tester);

      expect(find.text('Main task name'), findsOneWidget);
      expect(find.text('Due Date'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Add Task'), findsOneWidget);

      final addTask = find.byKey(const ValueKey("addTask"));
      final addDate = find.byKey(const ValueKey("addDate"));
      final addDescription = find.byKey(const ValueKey("addDescription"));
      final addTaskButton = find.byKey(const ValueKey("addTaskButton"));

      await tester.enterText(addTask, "Finish Widget Testing");
      await tester.enterText(addDescription, "Add functionality testing");
      await tester.tap(addTaskButton);
      await tester.pumpAndSettle();

      expect(find.byType(TodoList), findsOneWidget);
      expect(find.byType(AddTask), findsNothing);
      expect(find.text("Finish Widget Testing"), findsOneWidget);
    },
  );
}
