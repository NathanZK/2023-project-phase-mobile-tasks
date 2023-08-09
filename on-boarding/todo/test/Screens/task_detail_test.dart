import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/task_detail.dart';

void main() {
  testWidgets(
    'task detail ...',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TaskDetail(),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Deadline'), findsOneWidget);

      expect(find.byType(TextField), findsNWidgets(3));
    },
  );
}
