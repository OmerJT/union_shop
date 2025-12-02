import 'package:flutter/material.dart';
import 'package:union_shop/union_footer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _selectedColor = 'Black';
  String _selectedSize = 'S';
  int _quantity = 1;

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFF4d2963);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (same as other pages)
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: accent,
                    child: const Text(
                      'FREE CLICK & COLLECT FROM THE UNION SHOP',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          // Logo on the left
                          GestureDetector(
                            onTap: () => navigateToHome(context),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // About Us centred
                          Expanded(
                            child: Center(
                              child: TextButton(
                                onPressed: () => navigateToAbout(context),
                                child: const Text(
                                  'About Us',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Icons on the right
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.person_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Image unavailable',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Name
                      const Text(
                        'Portsmouth City Fridge Magnet',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Price
                      Text(
                        '£15.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: accent,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Colour / Size / Quantity
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Colour
                          const Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          DropdownButtonFormField<String>(
                            value: _selectedColor,
                            items: const [
                              DropdownMenuItem(
                                value: 'Black',
                                child: Text('Black'),
                              ),
                              DropdownMenuItem(
                                value: 'Grey',
                                child: Text('Grey'),
                              ),
                              DropdownMenuItem(
                                value: 'Purple',
                                child: Text('Purple'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value == null) return;
                              setState(() {
                                _selectedColor = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Size + Quantity in a row
                          Row(
                            children: [
                              // Size
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Size',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    DropdownButtonFormField<String>(
                                      value: _selectedSize,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'XS',
                                          child: Text('XS'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'S',
                                          child: Text('S'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'M',
                                          child: Text('M'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'L',
                                          child: Text('L'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'XL',
                                          child: Text('XL'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _selectedSize = value;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Quantity
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (_quantity > 1) {
                                                  _quantity--;
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.remove),
                                            visualDensity: VisualDensity.compact,
                                          ),
                                          Text('$_quantity'),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _quantity++;
                                              });
                                            },
                                            icon: const Icon(Icons.add),
                                            visualDensity: VisualDensity.compact,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Buttons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accent,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text(
                                'ADD TO BAG',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: accent, width: 1.5),
                                foregroundColor: accent,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text(
                                'BUY NOW',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Description
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'A colourful Portsmouth city design fridge magnet, perfect as a souvenir or small gift. '
                        'Designed in collaboration with local artists and exclusive to the Students\' Union shop.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            const UnionFooter(),
          ],
        ),
      ),
    );
  }
}
