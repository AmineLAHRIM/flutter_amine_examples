import 'package:get/get.dart';

import '../controllers/sliver_controller.dart';

class SliverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverController>(
      () => SliverController(),
    );
  }
}
