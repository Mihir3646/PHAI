import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SlideCard extends StatelessWidget {
  const SlideCard({
    super.key,
    required this.animationUrl,
    required this.title,
    required this.subtitle,
  });

  final String animationUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Lottie.network(animationUrl,
              fit: BoxFit.contain, width: double.infinity),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
