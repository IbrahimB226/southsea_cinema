import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });

  testWidgets(
    'SettingsView pre-fills saved settings on open',
    (WidgetTester tester) async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(
        <String, Object>{
          prefAddress: 'Portsmouth Guildhall, PO1 2AJ',
          prefEmail: 'alex@example.com',
          prefPatronNumber: '9999',
          prefReceiveNews: true,
        },
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Portsmouth Guildhall, PO1 2AJ'),
        findsOneWidget,
      );

      expect(
        find.text('alex@example.com'),
        findsOneWidget,
      );

      expect(
        find.text('9999'),
        findsOneWidget,
      );

      final Switch switchWidget = tester.widget<Switch>(
        find.byType(Switch),
      );

      expect(switchWidget.value, isTrue);
    },
  );

  testWidgets(
    'Saving settings stores values and reloads correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      final Finder addressField =
          find.byType(TextField).at(0);

      final Finder emailField =
          find.byType(TextField).at(1);

      final Finder patronField =
          find.byType(TextField).at(2);

      await tester.enterText(
        addressField,
        'Guildhall, PO1 2AJ',
      );

      await tester.enterText(
        emailField,
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );

      await tester.enterText(
        patronField,
        '5678',
      );

      await tester.ensureVisible(
        find.text('Save Settings'),
      );

      await tester.tap(
        find.text('Save Settings'),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Settings saved'),
        findsOneWidget,
      );

      final SharedPreferencesAsync prefs =
          SharedPreferencesAsync();

      expect(
        await prefs.getString(prefAddress),
        'Guildhall, PO1 2AJ',
      );

      expect(
        await prefs.getString(prefEmail),
        'gerald.vernon-jackson@portsmouthcc.gov.uk',
      );

      expect(
        await prefs.getString(prefPatronNumber),
        '5678',
      );

      await tester.pumpWidget(
        const SizedBox.shrink(),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsView(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Guildhall, PO1 2AJ'),
        findsOneWidget,
      );

      expect(
        find.text(
          'gerald.vernon-jackson@portsmouthcc.gov.uk',
        ),
        findsOneWidget,
      );

      expect(
        find.text('5678'),
        findsOneWidget,
      );
    },
  );
}