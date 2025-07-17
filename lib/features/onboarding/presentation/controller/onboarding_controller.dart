import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes.dart';

class OnboardingController extends GetxController {
  final box = GetStorage();

  final page = 0.obs;
  final pageController = PageController();

  static const hasOnboardedKey = 'hasOnboarded';

  bool get hasOnboarded => box.read(hasOnboardedKey) ?? false;

  @override
  void onInit() {
    super.onInit();
    if (hasOnboarded) {
      Future.microtask(() => Get.offAllNamed(AppRoutes.home));
    }
    pageController.addListener(() {
      page.value = pageController.page?.round() ?? 0;
    });
  }

  void next() {
    if (page.value == 2) {
      box.write(hasOnboardedKey, true);
      Get.offAllNamed(AppRoutes.home);
    } else {
      pageController.nextPage(duration: 300.ms, curve: Curves.ease);
    }
  }

  void back() {
    if (page.value > 0) {
      pageController.previousPage(duration: 300.ms, curve: Curves.ease);
    }
  }

  void skip() {
    box.write(hasOnboardedKey, true);
    Get.offAllNamed(AppRoutes.home);
  }
}
