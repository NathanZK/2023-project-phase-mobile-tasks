import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/add_task.dart';

void main() {
  testWidgets(
    'Add task UI elements work correctly',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AddTask(),
        ),
      );

      expect(find.text('Main task name'), findsOneWidget);
      expect(find.text('Due Date'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);

      expect(find.byType(TextField), findsNWidgets(3));
      expect(find.text('Add Task'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );
}
