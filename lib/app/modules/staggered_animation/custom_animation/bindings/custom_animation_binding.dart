import 'package:get/get.dart';

import '../controllers/custom_animation_controller.dart';

class CustomAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomAnimationController>(
      () => CustomAnimationController(),
    );
  }
}
