import 'dart:ui';

import 'package:flutter/material.dart';

class SemiFullScreenSheetView extends StatefulWidget {
  SemiFullScreenSheetView({required this.context});

  final BuildContext context;

  @override
  _SemiFullScreenSheetViewState createState() => _SemiFullScreenSheetViewState();
}

class _SemiFullScreenSheetViewState extends State<SemiFullScreenSheetView> {
  var widthBottomSheet = 100.0;
  var finalWidthSize = 100.0;
  final initialChildSize = 0.5;

  /*
  * final double range = upperBound - lowerBound;
      final double remainingFraction = range.isFinite ? (target - _value).abs() / range : 1.0;
  * */
  //1
  final upperBound = 0.8;
  final lowerBound = 0.4;

  late Tween<double> _tween;

  var isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //1
    if (isInit) {
      finalWidthSize = MediaQuery.of(context).size.width;
      widthBottomSheet = initialChildSize * finalWidthSize;
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(widget.context).padding.top,
      ),
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          //method 1
          double _percent = lerpDouble((lowerBound * upperBound) * (-(lowerBound + 1 - upperBound)), 1, notification.extent / (upperBound))!;

          // animaitionController method
          final double range = upperBound - lowerBound;
          // here traget of animation
          final double target = upperBound;
          final double _value = notification.extent;
          final double remainingFraction = 1-(range.isFinite ? (target - _value).abs() / range : 1.0);

          var value = finalWidthSize * _percent;

          print('scrollvalue ${_percent} | ${remainingFraction} ${value}');

          setState(() {
            widthBottomSheet = value;
          });

          return false;
        },
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: initialChildSize,
          minChildSize: lowerBound,
          maxChildSize: upperBound,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 16,
                        color: Colors.amberAccent,
                        width: widthBottomSheet,
                      ),
                      Text('${(widthBottomSheet / finalWidthSize).toStringAsFixed(2)}'),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et ligula ullamcorper malesuada proin. Tristique senectus et netus et malesuada fames ac. Massa tincidunt dui ut ornare lectus sit amet est. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. Ligula ullamcorper malesuada proin libero nunc consequat interdum varius. Sed viverra ipsum nunc aliquet bibendum. Varius morbi enim nunc faucibus a pellentesque sit amet porttitor. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Magna etiam tempor orci eu lobortis elementum nibh tellus molestie. Fames ac turpis egestas sed. Suspendisse in est ante in nibh mauris cursus.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et ligula ullamcorper malesuada proin. Tristique senectus et netus et malesuada fames ac. Massa tincidunt dui ut ornare lectus sit amet est. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. ed. Suspendisse in est ante in nibh mauris cursus.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

/*Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {}, child: child),
  );*/
}
