import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_about_page.dart';
import 'package:union_shop/print_personalisation_page.dart';

Widget _wrap(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  group('Print Shack about page', () {
    testWidgets('shows heading and call to action', (tester) async {
      await tester.pumpWidget(_wrap(const PrintShackAboutPage()));
      await tester.pumpAndSettle();

      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('Add a Personal Touch'), findsOneWidget);
      expect(find.text('START PERSONALISATION'), findsOneWidget);
    });
  });

  group('Print personalisation page', () {
    testWidgets(
      'shows one-line option by default, and can switch to two lines',
      (tester) async {
        await tester.pumpWidget(_wrap(const PrintPersonalisationPage()));
        await tester.pumpAndSettle();

        // Basic elements on first build
        expect(find.text('Personalisation'), findsOneWidget);
        expect(find.text('Personalisation line 1'), findsOneWidget);
        expect(find.text('Personalisation line 2'), findsNothing);
        expect(find.text('One line of text'), findsOneWidget);

        // Call onChanged on the dropdown directly (avoids flaky overlay taps)
        final dropdownFinder =
            find.byType(DropdownButtonFormField<String>);
        final dropdown = tester.widget<DropdownButtonFormField<String>>(
          dropdownFinder,
        );

        dropdown.onChanged?.call('Two lines of text');
        await tester.pumpAndSettle();

        // Now the second line field should appear
        expect(find.text('Personalisation line 2'), findsOneWidget);
      },
    );

    testWidgets(
      'shows a SnackBar when trying to add with no text',
      (tester) async {
        await tester.pumpWidget(_wrap(const PrintPersonalisationPage()));
        await tester.pumpAndSettle();

        // Initially there should be no SnackBar
        expect(find.byType(SnackBar), findsNothing);

        // Scroll the ADD TO CART button into view so the tap actually hits it
        await tester.ensureVisible(find.text('ADD TO CART'));
        await tester.pumpAndSettle();

        // Tap the button
        await tester.tap(find.text('ADD TO CART'));
        await tester.pump(const Duration(milliseconds: 300)); // let it appear

        // Now a SnackBar should be visible
        expect(find.byType(SnackBar), findsOneWidget);
      },
    );
  });
}

