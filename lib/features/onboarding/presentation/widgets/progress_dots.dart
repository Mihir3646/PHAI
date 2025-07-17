import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/onboarding_controller.dart';

class ProgressDots extends GetView<OnboardingController> {
  const ProgressDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: controller.page.value,
        count: 3,
        effect: WormEffect(
          activeDotColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
