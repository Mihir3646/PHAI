import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/progress_dots.dart';
import 'intro_page.dart';
import 'privacy_page.dart';
import 'theme_choice_page.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  static final _pages = [
    const IntroPage(),
    const PrivacyPage(),
    const ThemeChoicePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (i) => controller.page.value = i,
                children: _pages,
              ),
            ),
            const SizedBox(height: 24),
            const ProgressDots(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: controller.skip,
                    child: const Text('Skip'),
                  ),
                  const Spacer(),
                  Obx(
                    () => Visibility(
                      visible: controller.page.value > 0,
                      child: TextButton(
                        onPressed: controller.back,
                        child: const Text('Back'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.next,
                      child: Text(
                        controller.page.value == _pages.length - 1
                            ? 'Done'
                            : 'Next',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
