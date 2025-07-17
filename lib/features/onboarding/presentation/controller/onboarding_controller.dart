import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final box = GetStorage();
  final pageIndex = 0.obs;

  static const hasOnboardedKey = 'hasOnboarded';

  void completeOnboarding() {
    box.write(hasOnboardedKey, true);
  }
}
