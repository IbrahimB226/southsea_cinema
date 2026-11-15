import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  group('App smoke tests', () {
    testWidgets(
      'Home page displays title, movie cards and booking buttons',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

        expect(find.text('Southsea Cinema'), findsOneWidget);

        expect(find.text('Interstellar'), findsOneWidget);
        expect(find.text('Shutter Island'), findsOneWidget);

        expect(find.text('Book'), findsNWidgets(2));
      },
    );

    testWidgets(
      'Full booking flow works correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(const SouthseaCinemaApp());

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
  });
}