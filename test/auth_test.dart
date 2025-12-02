import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';

void main() {
  group('Auth Page Tests', () {
    Widget createTestWidget() => const MaterialApp(home: AuthPage());

    testWidgets('shows basic sign in elements', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('The UNION'), findsOneWidget);
      expect(find.text('Sign in'), findsOneWidget);
      expect(find.text('Sign in with shop'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });
  });
}
