import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/add_task.dart';
import 'package:todo/Screens/todo_list.dart';
import 'package:todo/main.dart';

navigateToTodoList(tester) async {
  final getStartedButton = find.byType(ElevatedButton);
  await tester.tap(getStartedButton);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('task detail UI elements and functionaity work correctly', (tester) async {
    await tester.pumpWidget(
      const TodoApp(),
    );
    await navigateToTodoList(tester);

    expect(find.byType(Image), findsOneWidget);
    expect(find.text("Tasks List"), findsOneWidget);

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text("Create Task"), findsOneWidget);

    final createTaskButton = find.byType(ElevatedButton);
    await tester.tap(createTaskButton);
    await tester.pumpAndSettle();

    expect(find.byType(TodoList), findsNothing);
    expect(find.byType(AddTask), findsOneWidget);
  });
}
