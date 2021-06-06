import 'package:get/get.dart';

import '../controllers/sliver_image_controller.dart';

class SliverImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverImageController>(
      () => SliverImageController(),
    );
  }
}
