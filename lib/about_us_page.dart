import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top "About us" content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'About us',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Welcome to the Union Shop!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'We’re dedicated to offering university-branded clothing and merchandise all year round, '
                        'with a mix of classic items and new seasonal ranges.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'For many products we also provide a small ',
                            ),
                            TextSpan(
                              text: 'personalisation service',
                              style: TextStyle(
                                color: Color(0xFF4d2963),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ', so students can add their own names or messages.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Online orders can be delivered or collected in store, giving you flexibility during busy term times.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'If you have any questions or comments, please contact the team at hello@upsu.net. '
                        'We love hearing feedback and suggestions for new products.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Happy shopping!',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'The Union Shop & Reception Team',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom three-column section (like the real site)
            Container(
              width: double.infinity,
              color: const Color(0xFFF5F5F5),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(child: _OpeningHoursColumn()),
                            SizedBox(width: 32),
                            Expanded(child: _HelpInfoColumn()),
                            SizedBox(width: 32),
                            Expanded(child: _LatestOffersColumn()),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _OpeningHoursColumn(),
                            SizedBox(height: 24),
                            _HelpInfoColumn(),
                            SizedBox(height: 24),
                            _LatestOffersColumn(),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OpeningHoursColumn extends StatelessWidget {
  const _OpeningHoursColumn();

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    const bodyStyle = TextStyle(
      fontSize: 14,
      height: 1.5,
    );
    const emphasisStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Opening Hours', style: headingStyle),
        SizedBox(height: 12),
        Text('Winter break information', style: emphasisStyle),
        Text(
          'Closing: 4pm on 19/12/2025\n'
          'Re-opening: 10am on 05/01/2026',
          style: bodyStyle,
        ),
        SizedBox(height: 8),
        Text(
          'Last post date for online orders: 12pm on 18/12/2025.',
          style: bodyStyle,
        ),
        SizedBox(height: 16),
        Text('Term time hours', style: emphasisStyle),
        Text(
          'Monday – Friday: 10am – 4pm\n'
          'Hours may differ outside of term time.',
          style: bodyStyle,
        ),
      ],
    );
  }
}

class _HelpInfoColumn extends StatelessWidget {
  const _HelpInfoColumn();

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    const linkStyle = TextStyle(
      fontSize: 14,
      height: 1.6,
      decoration: TextDecoration.underline,
      color: Colors.black87,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Help and Information', style: headingStyle),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: const Text('Search', style: linkStyle),
        ),
        const SizedBox(height: 4),
        const Text('Terms & Conditions of Sale Policy', style: linkStyle),
      ],
    );
  }
}

class _LatestOffersColumn extends StatelessWidget {
  const _LatestOffersColumn();

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Latest Offers', style: headingStyle),
        const SizedBox(height: 12),
        const Text(
          'Sign up with your email address to receive news and special offers.',
          style: TextStyle(fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Email address',
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Placeholder for subscribe action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'SUBSCRIBE',
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

