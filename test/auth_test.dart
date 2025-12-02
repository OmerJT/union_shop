import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';

void main() {
  group('Auth Page Tests', () {
    Widget createTestWidget() => const MaterialApp(home: AuthPage());

    testWidgets('shows basic sign in elements', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Already a customer?'), findsOneWidget);
      expect(find.text('Sign in using your email address and password.'), findsOneWidget);
      expect(find.text('SIGN IN'), findsOneWidget);
      expect(find.text('New customer?'), findsOneWidget);
      expect(find.text('Password'), findsWidgets);
    });
  });
}
