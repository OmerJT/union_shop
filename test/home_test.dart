import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(
        find.text('FREE CLICK & COLLECT FROM THE UNION SHOP'),
        findsOneWidget,
      );
      expect(find.text('Welcome to The Union Shop'), findsOneWidget);
      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards from data model',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // These come from ShopData.featuredProducts
      expect(find.text('Portsmouth City Fridge Magnet'), findsOneWidget);
      expect(find.text('A5 Notepad'), findsOneWidget);
      expect(find.text('Classic Sweatshirts - Neutral'), findsOneWidget);
      expect(find.text('Recycled Notebook'), findsOneWidget);
    });

    testWidgets('should display header icons and About Us link',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('About Us'), findsOneWidget);

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });
  });
}


