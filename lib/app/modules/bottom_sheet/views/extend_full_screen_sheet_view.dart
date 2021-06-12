import 'dart:ui';

import 'package:flutter/material.dart';

class ExtendFullScreenSheetView extends StatefulWidget {
  ExtendFullScreenSheetView({required this.context});

  final BuildContext context;

  @override
  _ExtendFullScreenSheetViewState createState() =>
      _ExtendFullScreenSheetViewState();
}

class _ExtendFullScreenSheetViewState extends State<ExtendFullScreenSheetView> {
  late var widthBottomSheet;
  late var finalWidthSize ;
  final initialChildSize = 0.4;

  final maxChildSize = 1.0;
  final minChildSize = 0.3;

  var isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //1
    if (isInit) {
      finalWidthSize=MediaQuery.of(context).size.width;
      widthBottomSheet = finalWidthSize;
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
          //2
          final percentOfExpand = 0.9;

          if (notification.extent >= percentOfExpand) {

            /*double _percent = lerpDouble(
                0, maxChildSize, notification.extent * 1 / maxChildSize)!;*/
            // 0.7 to 1.0 so lerpDouble begin from notification.extent-0.7=0.0
            double _percent = lerpDouble(0, 1/(1-percentOfExpand), notification.extent-percentOfExpand)!;
            //double _percent = lerpDouble(0, 1/(1-percentOfExpand)+1/(1-percentOfExpand)*1/(0.2*10), notification.extent-percentOfExpand)!;
            //_percent go from 0 to 1 so 1-_percent go from 1 to 0
            var value=finalWidthSize*(1-_percent);
            // lerp from finalWidthSize/0.3
            /*var value =
                lerpDouble(finalWidthSize / (1 - percentOfExpand), 0, _percent);*/
            //print('scrollvalue ${_percent} ${value}');
            print('scrollvalue ${notification.extent-0.7} _percent${_percent} ${value}');
            setState(() {
              widthBottomSheet = value;
            });
          } else {
            widthBottomSheet = finalWidthSize;
          }

          return false;
        },
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
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
                      Text(
                          '${(widthBottomSheet / finalWidthSize).toStringAsFixed(2)}'),
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
