import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_model.dart';
import 'package:union_shop/shop_data.dart';

void main() {
  test('CartModel adds items and calculates totals', () {
    final cart = CartModel();
    cart.clear();
    final product = ShopData.defaultProduct;

    cart.addItem(
      product,
      color: 'Black',
      size: 'M',
      quantity: 2,
    );

    expect(cart.items.length, 1);
    expect(cart.totalQuantity, 2);
    expect(
      cart.totalPrice,
      moreOrLessEquals(product.effectivePrice * 2),
    );
  });

  test('CartModel can hold multiple items', () {
    final cart = CartModel();
    cart.clear();

    final first = ShopData.defaultProduct;
    final second = ShopData.products[1];

    cart.addItem(first, color: 'Black', size: 'S', quantity: 1);
    cart.addItem(second, color: 'Grey', size: 'M', quantity: 3);

    expect(cart.items.length, 2);
    expect(cart.totalQuantity, 4);
  });

  test('CartModel can update item quantity and remove when zero', () {
    final cart = CartModel();
    cart.clear();

    final product = ShopData.defaultProduct;
    cart.addItem(
      product,
      color: 'Black',
      size: 'M',
      quantity: 1,
    );

    final item = cart.items.first;

    // Increase quantity
    cart.updateItemQuantity(item, 3);
    expect(item.quantity, 3);
    expect(cart.totalQuantity, 3);

    // Decrease quantity
    cart.updateItemQuantity(item, 1);
    expect(item.quantity, 1);
    expect(cart.totalQuantity, 1);

    // Set quantity to 0 => item should be removed
    cart.updateItemQuantity(item, 0);
    expect(cart.items.length, 0);
    expect(cart.totalQuantity, 0);
  });

  test('CartModel can remove a specific item', () {
    final cart = CartModel();
    cart.clear();

    final first = ShopData.defaultProduct;
    final second = ShopData.products[1];

    cart.addItem(first, color: 'Black', size: 'S', quantity: 1);
    cart.addItem(second, color: 'Grey', size: 'M', quantity: 2);

    expect(cart.items.length, 2);

    final secondItem = cart.items[1];
    cart.removeItem(secondItem);

    expect(cart.items.length, 1);
    expect(cart.items.first.product, first);
    expect(cart.totalQuantity, 1);
  });
}
