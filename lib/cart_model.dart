import 'package:union_shop/shop_data.dart';

class CartItem {
  final Product product;
  final String color;
  final String size;
  final int quantity;

  CartItem({
    required this.product,
    required this.color,
    required this.size,
    required this.quantity,
  });

  double get lineTotal => product.effectivePrice * quantity;

  String get lineTotalLabel => '£${lineTotal.toStringAsFixed(2)}';

  String get optionsLabel => 'Colour: $color · Size: $size';
}

class CartModel {
  CartModel._internal();
  static final CartModel _instance = CartModel._internal();

  /// Call `CartModel()` anywhere to get the shared instance.
  factory CartModel() => _instance;

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(
    Product product, {
    required String color,
    required String size,
    required int quantity,
  }) {
    _items.add(
      CartItem(
        product: product,
        color: color,
        size: size,
        quantity: quantity,
      ),
    );
  }

  void clear() {
    _items.clear();
  }

  int get totalQuantity =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.lineTotal);

  String get totalPriceLabel =>
      '£${totalPrice.toStringAsFixed(2)}';

  bool get isEmpty => _items.isEmpty;
}
