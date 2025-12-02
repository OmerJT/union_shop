import 'package:flutter/material.dart';
import 'package:union_shop/auth_model.dart';
import 'package:union_shop/union_footer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _navigateHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _signOut(BuildContext context) {
    AuthModel().signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have been signed out.')),
    );
    _navigateHome(context);
  }

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);
    final auth = AuthModel();
    final user = auth.currentUser;

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
                      'MY ACCOUNT',
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
                            onTap: () => _navigateHome(context),
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
                          const Spacer(),
                          const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: accent,
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
                      Text(
                        user != null ? 'Hello, ${user.name}' : 'Account',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (user == null)
                        const Text(
                          'You are not signed in. Please sign in or create an account.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      else ...[
                        const Text(
                          'Account details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Name: ${user.name}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'You have no previous orders in this demo application.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () => _signOut(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(
                              'SIGN OUT',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
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
