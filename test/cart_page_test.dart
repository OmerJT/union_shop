import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_model.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/shop_data.dart';

void main() {
  testWidgets('Cart page shows empty message when there are no items',
      (tester) async {
    final cart = CartModel();
    cart.clear();

    await tester.pumpWidget(
      const MaterialApp(
        home: CartPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Your Bag'), findsOneWidget);
    expect(find.text('Your bag is empty.'), findsOneWidget);
  });

  testWidgets('Cart page shows items from cart model', (tester) async {
    final cart = CartModel();
    cart.clear();

    final product = ShopData.defaultProduct;
    cart.addItem(
      product,
      color: 'Black',
      size: 'M',
      quantity: 1,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: CartPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(product.name), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
  });
}
