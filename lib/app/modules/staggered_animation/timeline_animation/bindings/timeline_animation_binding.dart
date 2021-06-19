import 'package:get/get.dart';

import '../controllers/timeline_animation_controller.dart';

class TimelineAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimelineAnimationController>(
      () => TimelineAnimationController(),
    );
  }
}
