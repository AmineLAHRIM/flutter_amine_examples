import 'package:get/get.dart';

import '../controllers/staggered_animation_controller.dart';

class StaggeredAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaggeredAnimationController>(
      () => StaggeredAnimationController(),
    );
  }
}
