import 'package:flutter/material.dart';
import '../widgets/onboarding_screen.dart';

class OnboardingStep1 extends StatelessWidget {
  const OnboardingStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      emoji: '🚴‍♀️',
      title: 'Products from worldwide',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      currentStep: 0,
      totalSteps: 3,
      onNext: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingStep2()),
        );
      },
      onSkip: () {
        Navigator.pushReplacementNamed(context, '/');
      },
    );
  }
}

class OnboardingStep2 extends StatelessWidget {
  const OnboardingStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      emoji: '🏃‍♀️',
      title: 'Buy from anywhere',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      currentStep: 1,
      totalSteps: 3,
      onNext: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingStep3()),
        );
      },
      onSkip: () {
        Navigator.pushReplacementNamed(context, '/');
      },
    );
  }
}

class OnboardingStep3 extends StatelessWidget {
  const OnboardingStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      emoji: '👥',
      title: 'Join the community',
      description:
          'Get advice and inspiration from more than 1 million users and help each other out',
      currentStep: 2,
      totalSteps: 3,
      onNext: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Welcome!'),
            content: const Text('Onboarding complete!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        );
      },
      onSkip: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Welcome!'),
            content: const Text('Onboarding complete!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        );
      },
      buttonLabel: 'Get Started',
    );
  }
}
