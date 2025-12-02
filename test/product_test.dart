import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: ProductPage(),
      );
    }

    testWidgets('should display product page with basic elements', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Updated header banner
      expect(
        find.text('FREE CLICK & COLLECT FROM THE UNION SHOP'),
        findsOneWidget,
      );

      // Product title, price and description
      expect(find.text('Portsmouth City Fridge Magnet'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display call-to-action button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // New CTA instead of placeholder student instruction text
      expect(find.text('ADD TO BAG'), findsOneWidget);
    });

    testWidgets('should display header icons and About Us link',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // About Us nav item
      expect(find.text('About Us'), findsOneWidget);

      // Header icons
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Basic footer text
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}

