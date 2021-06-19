import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

// Create enum that defines the animated properties
enum AniProps { width, height, color, positionX, positionY, radius,rotate }

class TimelineAnimationView extends StatefulWidget {
  // Specify your tween
  @override
  _TimelineAnimationViewState createState() => _TimelineAnimationViewState();
}

class _TimelineAnimationViewState extends State<TimelineAnimationView> {
  CustomAnimationControl _control = CustomAnimationControl.stop; // <-- state variable

  final _tween = TimelineTween<AniProps>()
    ..addScene(begin: 0.milliseconds, end: 1000.milliseconds).animate(
      AniProps.width,
      tween: Tween(begin: 0.0, end: 100.0),
    )
    ..addScene(begin: 1000.milliseconds, end: 1500.milliseconds).animate(
      AniProps.width,
      tween: Tween(begin: 100.0, end: 200.0),
    )
    ..addScene(begin: 0.milliseconds, duration: 2500.milliseconds).animate(
      AniProps.height,
      tween: Tween(begin: 0.0, end: 200.0),
    )
    ..addScene(begin: 0.milliseconds, duration: 3.seconds).animate(
      AniProps.color,
      tween: ColorTween(begin: Colors.red, end: Colors.blue),
    );

  final _tween2 = TimelineTween<AniProps>()
    ..addScene(begin: 0.seconds, end: 1.seconds).animate(
      AniProps.width,
      tween: Tween(begin: 100.0, end: 200.0),
    )
    /*..addScene(begin: 1.seconds, end: 2.seconds).animate(
      AniProps.width,
      tween: Tween(begin: 100.0, end: 200.0),
    )*/
    ..addScene(begin: 0.seconds, end: 2.seconds).animate(
      AniProps.height,
      tween: Tween(begin: 100.0, end: 200.0),
    )
    ..addScene(begin: 0.seconds, end: 2.seconds).animate(
      AniProps.color,
      tween: ColorTween(begin: Colors.red, end: Colors.amberAccent),
    );

  final _tween3 = TimelineTween<AniProps>()
    ..addScene(begin: 0.milliseconds, duration: 3.seconds).animate(
      AniProps.positionX,
      tween: Tween(begin: -1.0, end: 1.0),
    )
    ..addScene(begin: 0.milliseconds, duration: 3.seconds).animate(
      AniProps.positionY,
      tween: Tween(begin: -1.0, end: 1.0),
    )
    ..addScene(begin: 0.milliseconds, duration: 3.seconds).animate(
      AniProps.radius,
      tween: Tween(begin: 0.0, end: 100.0),
    )
    ..addScene(begin: 2.milliseconds, duration: 3.seconds).animate(
      AniProps.rotate,
      tween: Tween(begin: 0.0, end: 2*pi),
    )
    ..addScene(begin: 0.seconds, end: 3.seconds).animate(
      AniProps.color,
      tween: ColorTween(begin: Colors.red, end: Colors.amberAccent),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimelineAnimationView'),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () => toggleDirection(),
        child: CustomAnimation<TimelineValue<AniProps>>(
            control: _control,
            tween: _tween3,
            curve: Curves.ease,
            duration: _tween3.duration,
            // Obtain duration
            builder: (context, child, value) {
              /*return Container(
                width: value.get(AniProps.width), // Get animated value for width
                height: value.get(AniProps.height), // Get animated value for height
                color: value.get(AniProps.color), // Get animated value for color
                child: Center(
                  child: Text(
                    'width =${value.get<double>(AniProps.width).toStringAsFixed(2)} | height=${value.get<double>(AniProps.height).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );*/
              return Align(
                alignment: Alignment(
                  value.get(AniProps.positionX),
                  value.get(AniProps.positionY),
                ),
                child: Transform.rotate(
                  angle: value.get(AniProps.rotate),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(value.get(AniProps.radius)),
                    child: Container(
                      width: 200, // Get animated value for width
                      height: 200, // Get animated value for height
                      color: value.get(AniProps.color), // Get animated value for color
                      child: CachedNetworkImage(
                        imageUrl: 'https://assets-global.website-files.com/6005fac27a49a9cd477afb63/60576840e7d265198541a372_bavassano_homepage_gp.jpg',
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void toggleDirection() {
    setState(() {
      // toggle between control instructions
      _control = (_control == CustomAnimationControl.play) ? CustomAnimationControl.playReverse : CustomAnimationControl.play;
    });
  }
}
