import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });

  group('App smoke tests', () {
    testWidgets(
      'Home page displays title, movie cards and booking buttons',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());
        await tester.pumpAndSettle();

        expect(find.text('Southsea Cinema'), findsOneWidget);

        expect(find.text('Interstellar'), findsOneWidget);
        expect(find.text('Shutter Island'), findsOneWidget);

        expect(find.text('Book'), findsWidgets);
      },
    );

    testWidgets(
      'Full booking flow works correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Book').first);
        await tester.pumpAndSettle();

        expect(find.text('Interstellar (12A)'), findsOneWidget);

        await tester.ensureVisible(find.text('Add to order'));

        await tester.tap(find.text('Add to order'));
        await tester.pump();

        expect(
          find.text('0 ticket(s) added to your order'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Booking different movies shows correct details and resets feedback',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Book').first);
        await tester.pumpAndSettle();

        expect(find.text('Interstellar (12A)'), findsOneWidget);

        await tester.ensureVisible(find.text('Add to order'));
        await tester.tap(find.text('Add to order'));
        await tester.pump();

        expect(
          find.text('0 ticket(s) added to your order'),
          findsOneWidget,
        );

        Navigator.of(
          tester.element(find.text('Interstellar (12A)')),
        ).pop();

        await tester.pumpAndSettle();

        await tester.tap(find.text('Book').last);
        await tester.pumpAndSettle();

        expect(find.text('Shutter Island (15)'), findsOneWidget);

        expect(
          find.text('0 ticket(s) added to your order'),
          findsNothing,
        );
      },
    );
  });
}