import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/getting_started.dart';
import 'package:todo/Screens/todo_list.dart';
import 'package:todo/main.dart';

void main() {
  testWidgets(
    'getting started UI displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(const TodoApp());
      await tester.pumpAndSettle();

      final getStartedButton = find.byType(ElevatedButton);
      expect(getStartedButton, findsOneWidget);
      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();

      expect(find.byType(GetStarted), findsNothing);
      expect(find.byType(TodoList), findsOneWidget);
    },
  );
}
