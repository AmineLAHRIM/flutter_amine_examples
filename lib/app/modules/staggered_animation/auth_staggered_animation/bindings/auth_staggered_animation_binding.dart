import 'package:get/get.dart';

import '../controllers/auth_staggered_animation_controller.dart';

class AuthStaggeredAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthStaggeredAnimationController>(
      () => AuthStaggeredAnimationController(),
    );
  }
}
