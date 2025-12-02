import 'package:flutter/material.dart';
import 'package:union_shop/union_footer.dart';

class PrintPersonalisationPage extends StatefulWidget {
  const PrintPersonalisationPage({super.key});

  @override
  State<PrintPersonalisationPage> createState() =>
      _PrintPersonalisationPageState();
}

class _PrintPersonalisationPageState extends State<PrintPersonalisationPage> {
  final TextEditingController _line1Controller = TextEditingController();
  final TextEditingController _line2Controller = TextEditingController();

  String _lineOption = 'One line of text';
  int _quantity = 1;

  double get _unitPrice =>
      _lineOption == 'One line of text' ? 3.0 : 5.0;

  String get _unitPriceLabel => '£${_unitPrice.toStringAsFixed(2)}';

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void navigateToPrintShack(BuildContext context) {
    Navigator.pushNamed(context, '/print-shack');
  }

  void navigateToAuth(BuildContext context) {
    Navigator.pushNamed(context, '/auth');
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  void placeholderCallbackForButtons() {}

  void _addToCartDemo() {
    final line1 = _line1Controller.text.trim();
    final line2 = _line2Controller.text.trim();

    if (line1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter at least the first line of text.'),
        ),
      );
      return;
    }

    if (_lineOption == 'Two lines of text' && line2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the second line of text.'),
        ),
      );
      return;
    }

    final total = _unitPrice * _quantity;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Demo only: $_quantity item(s) with $_lineOption '
          'would be added (£${total.toStringAsFixed(2)}).',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _line1Controller.dispose();
    _line2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
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
                          Expanded(
                            child: Center(
                              child: Wrap(
                                spacing: 16,
                                alignment: WrapAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () => navigateToAbout(context),
                                    child: const Text(
                                      'About Us',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        navigateToPrintShack(context),
                                    child: const Text(
                                      'Print Shack',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                onPressed: () => navigateToAuth(context),
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
                                onPressed: () => navigateToCart(context),
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

            // Content
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildImageAndPreview()),
                            const SizedBox(width: 32),
                            Expanded(child: _buildForm(accent)),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImageAndPreview(),
                            const SizedBox(height: 24),
                            _buildForm(accent),
                          ],
                        ),
                ),
              ),
            ),

            const UnionFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main image
        Container(
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              // Hoodie-style image
              'https://images.pexels.com/photos/6311574/pexels-photo-6311574.jpeg?auto=compress&cs=tinysrgb&w=1200',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Thumbnails (static)
        Row(
          children: [
            _buildThumbnailBox(),
            const SizedBox(width: 8),
            _buildThumbnailBox(),
            const SizedBox(width: 8),
            _buildThumbnailBox(),
          ],
        ),
        const SizedBox(height: 24),

        // Live preview
        const Text(
          'Live preview',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _line1Controller.text.isEmpty
                      ? 'YOUR NAME'
                      : _line1Controller.text.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Color(0xFF4d2963),
                  ),
                ),
                if (_lineOption == 'Two lines of text')
                  Text(
                    _line2Controller.text.isEmpty
                        ? 'SECOND LINE'
                        : _line2Controller.text.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Color(0xFF4d2963),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Preview updates as you type. Final print may vary slightly on the garment.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildThumbnailBox() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(
        Icons.checkroom,
        size: 24,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildForm(Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personalisation',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _unitPriceLabel,
          style: TextStyle(          // <- const removed here
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: accent,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Tax included.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 24),

        // Per line dropdown
        const Text(
          'Per line:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: _lineOption,
          items: const [
            DropdownMenuItem(
              value: 'One line of text',
              child: Text('One line of text'),
            ),
            DropdownMenuItem(
              value: 'Two lines of text',
              child: Text('Two lines of text'),
            ),
          ],
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _lineOption = value;
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
        const SizedBox(height: 16),

        // Line 1
        const Text(
          'Personalisation line 1',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _line1Controller,
          maxLength: 10,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            counterText: '',
          ),
        ),
        const SizedBox(height: 12),

        // Line 2 (conditional)
        if (_lineOption == 'Two lines of text') ...[
          const Text(
            'Personalisation line 2',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: _line2Controller,
            maxLength: 10,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              counterText: '',
            ),
          ),
          const SizedBox(height: 12),
        ],

        // Quantity
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) _quantity--;
                  });
                },
              ),
              Text('$_quantity'),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Add to cart (demo)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _addToCartDemo,
            style: ElevatedButton.styleFrom(
              backgroundColor: accent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        const Text(
          '£3 for one line of text • £5 for two lines.\n'
          'One line of text is up to 10 characters.',
          style: TextStyle(fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 12),
        const Text(
          'Please double-check your spelling before submitting your order, '
          'as we will print exactly what you type. Personalised items are made specially for you '
          'and usually cannot be refunded unless faulty.',
          style: TextStyle(fontSize: 14, height: 1.6),
        ),
      ],
    );
  }
}
