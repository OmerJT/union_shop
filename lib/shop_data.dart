import 'package:flutter/foundation.dart';

/// Simple product data model for the Union Shop app.
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? salePrice;
  final String imageUrl;
  final String category; // e.g. "Clothing", "Stationery", "Gifts"
  final bool featuredOnHome;
  final bool soldOut;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.salePrice,
    required this.imageUrl,
    required this.category,
    this.featuredOnHome = false,
    this.soldOut = false,
  });

  /// True if the product has a valid sale price lower than the base price.
  bool get isOnSale => salePrice != null && salePrice! < price;

  /// The price that should be shown as the main/large price.
  double get effectivePrice => salePrice ?? price;

  String get priceLabel => _formatPrice(effectivePrice);

  String? get originalPriceLabel =>
      isOnSale ? _formatPrice(price) : null;

  static String _formatPrice(double value) {
    return '£${value.toStringAsFixed(2)}';
  }
}

/// Central place for all dummy data used by the app.
class ShopData {
  /// All products in the dummy shop.
  static final List<Product> products = [
    const Product(
      id: 'portsmouth-magnet',
      name: 'Portsmouth City Fridge Magnet',
      description:
          'A colourful Portsmouth city design fridge magnet, perfect as a souvenir or small gift. '
          'Designed in collaboration with local artists and exclusive to the Students\' Union shop.',
      price: 15.00,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Gifts',
      featuredOnHome: true,
    ),
    const Product(
      id: 'a5-notepad',
      name: 'A5 Notepad',
      description:
          'A handy A5 notepad with Union branding for your lecture notes and to-do lists.',
      price: 3.00,
      salePrice: 1.50,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Stationery',
      featuredOnHome: true,
      soldOut: true,
    ),
    const Product(
      id: 'classic-sweatshirt',
      name: 'Classic Sweatshirts - Neutral',
      description:
          'Bringing to you, our best selling Classic Sweatshirt. Available in different colours.',
      price: 23.00,
      salePrice: 10.99,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Clothing',
      featuredOnHome: true,
    ),
    const Product(
      id: 'recycled-notebook',
      name: 'Recycled Notebook',
      description:
          'Eco-friendly recycled notebook, perfect for lecture notes and revision plans.',
      price: 2.50,
      salePrice: 1.80,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Stationery',
      featuredOnHome: true,
    ),
    const Product(
      id: 'union-keyring',
      name: 'Union Logo Keyring',
      description:
          'Metal keyring featuring the Union logo. A simple way to show your UoP pride.',
      price: 3.00,
      salePrice: 1.50,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Gifts',
    ),
    const Product(
      id: 'hoodie',
      name: 'University Hoodie',
      description:
          'Comfy hoodie with the university logo. Great for lectures, library days and chilly evenings.',
      price: 28.00,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Clothing',
    ),
    const Product(
      id: 'tote-bag',
      name: 'Portsmouth Tote Bag',
      description:
          'Reusable tote bag with a Portsmouth city illustration. Ideal for carrying books or groceries.',
      price: 6.00,
      salePrice: 4.00,
      imageUrl:
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      category: 'Gifts',
    ),
  ];

  /// Default product used when nothing specific is requested (e.g. tests).
  static Product get defaultProduct => products.first;

  /// Find a product by ID, or return [defaultProduct] if not found.
  static Product findProductById(String id) {
    return products.firstWhere(
      (p) => p.id == id,
      orElse: () => defaultProduct,
    );
  }

  /// Products that should appear on the homepage "Products section".
  static List<Product> get featuredProducts =>
      products.where((p) => p.featuredOnHome).toList();

  /// All products that are on sale.
  static List<Product> get saleProducts =>
      products.where((p) => p.isOnSale).toList();

  /// All categories present in the catalogue.
  static List<String> get categories {
    final set = <String>{};
    for (final p in products) {
      set.add(p.category);
    }
    final list = set.toList()..sort();
    list.insert(0, 'All');
    return list;
  }

  /// Convenience for debugging/demos.
  static void debugLogProducts() {
    for (final p in products) {
      debugPrint('${p.id} – ${p.name} – ${p.priceLabel}'
          '${p.isOnSale ? ' (sale ${p.originalPriceLabel})' : ''}');
    }
  }
}
