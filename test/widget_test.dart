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
  });
}
