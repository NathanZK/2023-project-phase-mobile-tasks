import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/todo_list.dart';

void main() {
  testWidgets('task detail ...', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: TodoList(),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.text("Tasks List"), findsOneWidget);

    expect(find.byType(ListView), findsOneWidget);

    expect(find.text("Create Task"), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
