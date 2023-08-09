import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/Screens/getting_started.dart';

void main() {
  testWidgets(
    'getting started UI displayed correctly',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GetStarted(),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.text("Get Started"), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );
}
