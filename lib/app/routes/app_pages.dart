import 'package:get/get.dart';

import 'package:flutter_amine_examples/app/modules/bottom_sheet/bindings/bottom_sheet_binding.dart';
import 'package:flutter_amine_examples/app/modules/bottom_sheet/views/bottom_sheet_view.dart';
import 'package:flutter_amine_examples/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_amine_examples/app/modules/home/views/home_view.dart';
import 'package:flutter_amine_examples/app/modules/sliver/bindings/sliver_binding.dart';
import 'package:flutter_amine_examples/app/modules/sliver/views/sliver_view.dart';
import 'package:flutter_amine_examples/app/modules/sliver_image/bindings/sliver_image_binding.dart';
import 'package:flutter_amine_examples/app/modules/sliver_image/views/sliver_image_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SLIVER,
      page: () => SliverView(),
      binding: SliverBinding(),
    ),
    GetPage(
      name: _Paths.SLIVER_IMAGE,
      page: () => SliverImageView(),
      binding: SliverImageBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_SHEET,
      page: () => BottomSheetView(),
      binding: BottomSheetBinding(),
    ),
  ];
}
