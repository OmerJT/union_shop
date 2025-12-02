import 'package:flutter/material.dart';

class UnionFooter extends StatelessWidget {
  const UnionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    const bgColor = Color(0xFFF6F5F4);

    Widget columns = isWide
        ? const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _OpeningHoursColumn()),
              SizedBox(width: 32),
              Expanded(child: _HelpInfoColumn()),
              SizedBox(width: 32),
              Expanded(child: _LatestOffersColumn()),
            ],
          )
        : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OpeningHoursColumn(),
              SizedBox(height: 24),
              _HelpInfoColumn(),
              SizedBox(height: 24),
              _LatestOffersColumn(),
            ],
          );

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: columns,
        ),
      ),
    );
  }
}

class _FooterTitle extends StatelessWidget {
  final String text;

  const _FooterTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }
}

class _OpeningHoursColumn extends StatelessWidget {
  const _OpeningHoursColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterTitle('Opening Hours'),
        SizedBox(height: 12),
        Text(
          '❄ Winter Break Closure Dates ❄\n'
          'Closing: 4pm 19/12/2025\n'
          'Re-opening: 10am 05/01/2026\n'
          '\n'
          'Last post date for online orders:\n'
          '12pm on 18/12/2025\n'
          '\n'
          '--------------------------\n'
          '(Term Time)\n'
          'Mon – Fri 10am – 4pm\n'
          '\n'
          '(Outside Term / Consolidation)\n'
          'Mon – Fri 10am – 3pm\n'
          '\n'
          'Purchase online 24/7',
          style: TextStyle(
            fontSize: 13,
            height: 1.4,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _HelpInfoColumn extends StatelessWidget {
  const _HelpInfoColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterTitle('Help and Information'),
        SizedBox(height: 12),
        Text(
          'Search',
          style: TextStyle(
            fontSize: 13,
            height: 1.6,
            color: Colors.black87,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          'Terms & Conditions\nof Sale Policy',
          style: TextStyle(
            fontSize: 13,
            height: 1.6,
            color: Colors.black87,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}

class _LatestOffersColumn extends StatelessWidget {
  const _LatestOffersColumn();

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4d2963);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FooterTitle('Latest Offers'),
        const SizedBox(height: 12),
        const Text(
          'Sign up with your email address to receive\nnews and special offers.',
          style: TextStyle(
            fontSize: 13,
            height: 1.4,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email address',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Placeholder subscribe action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'SUBSCRIBE',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

