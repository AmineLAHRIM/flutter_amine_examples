import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SimpleSheetView extends GetView {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et ligula ullamcorper malesuada proin. Tristique senectus et netus et malesuada fames ac. Massa tincidunt dui ut ornare lectus sit amet est. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. Ligula ullamcorper malesuada proin libero nunc consequat interdum varius. Sed viverra ipsum nunc aliquet bibendum. Varius morbi enim nunc faucibus a pellentesque sit amet porttitor. Commodo ullamcorper a lacus vestibulum sed arcu non odio euismod. Magna etiam tempor orci eu lobortis elementum nibh tellus molestie. Fames ac turpis egestas sed. Suspendisse in est ante in nibh mauris cursus.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et ligula ullamcorper malesuada proin. Tristique senectus et netus et malesuada fames ac. Massa tincidunt dui ut ornare lectus sit amet est. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. ed. Suspendisse in est ante in nibh mauris cursus.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
