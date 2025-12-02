import 'package:flutter/material.dart';
import 'package:union_shop/auth_model.dart';
import 'package:union_shop/union_footer.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _signInEmailController = TextEditingController();
  final _signInPasswordController = TextEditingController();

  final _registerNameController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();

  @override
  void dispose() {
    _signInEmailController.dispose();
    _signInPasswordController.dispose();
    _registerNameController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    super.dispose();
  }

  void _navigateHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _signIn(BuildContext context) {
    try {
      AuthModel().signIn(
        email: _signInEmailController.text,
        password: _signInPasswordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed in successfully.')),
      );
      Navigator.pushReplacementNamed(context, '/account');
    } catch (e) {
      _showError(context, e.toString().replaceFirst('Exception: ', ''));
    }
  }

  void _register(BuildContext context) {
    try {
      AuthModel().register(
        name: _registerNameController.text,
        email: _registerEmailController.text,
        password: _registerPasswordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created and signed in.')),
      );
      Navigator.pushReplacementNamed(context, '/account');
    } catch (e) {
      _showError(context, e.toString().replaceFirst('Exception: ', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);
    final isWide = MediaQuery.of(context).size.width > 700;

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
                      'ACCOUNT',
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

            // Auth content
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _SignInSection(
                                emailController: _signInEmailController,
                                passwordController: _signInPasswordController,
                                onSubmit: () => _signIn(context),
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: _RegisterSection(
                                nameController: _registerNameController,
                                emailController: _registerEmailController,
                                passwordController: _registerPasswordController,
                                onSubmit: () => _register(context),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SignInSection(
                              emailController: _signInEmailController,
                              passwordController: _signInPasswordController,
                              onSubmit: () => _signIn(context),
                            ),
                            const SizedBox(height: 32),
                            _RegisterSection(
                              nameController: _registerNameController,
                              emailController: _registerEmailController,
                              passwordController: _registerPasswordController,
                              onSubmit: () => _register(context),
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

class _SignInSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  const _SignInSection({
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Already a customer?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sign in using your email address and password.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Text('Email address'),
        const SizedBox(height: 4),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Password'),
        const SizedBox(height: 4),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: accent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'SIGN IN',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  const _RegisterSection({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New customer?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Create an account to save your details.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Text('Full name'),
        const SizedBox(height: 4),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Email address'),
        const SizedBox(height: 4),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Password'),
        const SizedBox(height: 4),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: accent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
