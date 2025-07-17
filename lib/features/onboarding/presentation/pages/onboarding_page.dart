import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/slide_card.dart';
import '../widgets/dots_indicator.dart';

class OnboardingPage extends GetView<OnboardingController> {
  OnboardingPage({super.key});

  final _pageController = PageController();

  final _slides = const [
    (
      'https://assets9.lottiefiles.com/packages/lf20_iwmd6pyr.json',
      'Welcome',
      'Discover new possibilities'
    ),
    (
      'https://assets9.lottiefiles.com/packages/lf20_touohxv0.json',
      'Learn',
      'Build your skills quickly'
    ),
    (
      'https://assets9.lottiefiles.com/packages/lf20_w51pcehl.json',
      'Achieve',
      'Reach your goals faster'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: controller.pageIndex,
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return SlideCard(
                      animationUrl: slide.$1,
                      title: slide.$2,
                      subtitle: slide.$3,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => DotsIndicator(
                  controller: _pageController,
                  count: _slides.length,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () {
            if (controller.pageIndex.value == _slides.length - 1) {
              controller.completeOnboarding();
              Get.offAllNamed(Routes.home);
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          backgroundColor: colorScheme.primary,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
