import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Header banner text updated by the student
      expect(
        find.text('FREE CLICK & COLLECT FROM THE UNION SHOP'),
        findsOneWidget,
      );

      // Hero section title + main button
      expect(find.text('Welcome to The Union Shop'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

      // Products section title + secondary button
      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that product cards are displayed
      expect(find.text('Placeholder Product 1'), findsOneWidget);
      expect(find.text('Placeholder Product 2'), findsOneWidget);
      expect(find.text('Placeholder Product 3'), findsOneWidget);
      expect(find.text('Placeholder Product 4'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header icons and About Us link',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // New About Us nav item
      expect(find.text('About Us'), findsOneWidget);

      // Header icons
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Basic footer text (can be customised later)
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}

