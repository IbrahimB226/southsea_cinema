import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

void main() {
  testWidgets(
    'PrimaryButton displays label and triggers callback',
    (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Book',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Book'), findsOneWidget);

      await tester.tap(find.text('Book'));
      await tester.pump();

      expect(pressed, true);
    },
  );
}
