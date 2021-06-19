import 'package:flutter/material.dart';
import 'package:flutter_amine_examples/app/modules/staggered_animation/custom_animation/controllers/custom_animation_controller.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

class CustomAnimationView extends GetView<CustomAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CustomAnimationView'),
          centerTitle: true,
        ),
        body: Center(
          child: CustomAnimation<double>(
            control: CustomAnimationControl.playReverse,
            tween: Tween(begin: 100.0, end: 200.0),
            duration: 2.seconds,
            delay: 1.seconds,
            curve: Curves.easeInOut,
            child: Center(
                child: Text(
              "Hello!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
            startPosition: 0.5,
            animationStatusListener: (status) {
              print("status updated: $status");
            },
            builder: (context, child, value) {
              return Container(
                  width: value, height: value, color: Colors.blue, child: child);
            },
          ),
        ));
  }
}
