import 'package:flutter/material.dart';
import 'package:union_shop/union_footer.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void navigateToPrintShack(BuildContext context) {
    // Stay on this page if already here, but keeping method for consistency.
  }

  void navigateToAuth(BuildContext context) {
    Navigator.pushNamed(context, '/auth');
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  void navigateToPersonalisation(BuildContext context) {
    Navigator.pushNamed(context, '/print-personalisation');
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

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
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'The Print Shack',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'The Print Shack is the Union’s in-house personalisation service. '
                        'We help you add names, teams, and messages to your favourite Union clothing and merch.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'From hoodies and t-shirts to accessories, you can add a short line of text to make your item unique. '
                        'Personalised items are perfect for clubs and societies, gifts, or just treating yourself.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'How it works',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '1. Choose your clothing item from the Union Shop.\n'
                        '2. Visit our personalisation page to add your text.\n'
                        '3. Collect your finished item from the Union Shop once it is ready.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 24),

                      // Highlight section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isWide
                            ? Row(
                                children: [
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Add a Personal Touch',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Already picked out your hoodie or sweatshirt? '
                                          'Use our personalisation form to add a name or short message (up to 10 characters per line).',
                                          style: TextStyle(
                                            fontSize: 16,
                                            height: 1.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  SizedBox(
                                    width: 220,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          navigateToPersonalisation(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: accent,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: const Text(
                                        'START PERSONALISATION',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Add a Personal Touch',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Already picked out your hoodie or sweatshirt? '
                                    'Use our personalisation form to add a name or short message (up to 10 characters per line).',
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.6,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          navigateToPersonalisation(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: accent,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: const Text(
                                        'START PERSONALISATION',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
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
}
