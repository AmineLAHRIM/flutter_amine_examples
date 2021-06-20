import 'package:flutter/material.dart';
import 'package:flutter_amine_examples/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

import '../controllers/staggered_animation_controller.dart';

class StaggeredAnimationView extends GetView<StaggeredAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StaggeredAnimationView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.CUSTOM_ANIMATION);
                  },
                  child: Text(
                    'Custom Animation',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TIMELINE_ANIMATION);
                  },
                  child: Text(
                    'TimeLine Animation',
                    textAlign: TextAlign.center,
                  ),
                ),ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.AUTH_STAGGERED_ANIMATION);
                  },
                  child: Text(
                    'Auth Staggered Animation',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
