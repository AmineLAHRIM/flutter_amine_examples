import 'package:flutter/material.dart';
import 'package:flutter_amine_examples/app/modules/bottom_sheet/views/extend_full_screen_sheet_view.dart';
import 'package:flutter_amine_examples/app/modules/bottom_sheet/views/full_screen_sheet_view.dart';
import 'package:flutter_amine_examples/app/modules/bottom_sheet/views/semi_full_screen_sheet_view.dart';
import 'package:flutter_amine_examples/app/modules/bottom_sheet/views/simple_sheet_view.dart';
import 'package:get/get.dart';

import '../controllers/bottom_sheet_controller.dart';

class BottomSheetView extends GetView<BottomSheetController> {
  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('BottomSheetView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
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
                        showModalBottomSheet(
                          // enableDrag: false,
                          // isDismissible: false,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (context) => SimpleSheetView(),
                        );
                      },
                      child: Text(
                        'Simple Sheet',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => FullScreenSheetView(context:mainContext),
                        );
                      },
                      child: Text(
                        'Full Screen Sheet',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => ExtendFullScreenSheetView(context: mainContext,),
                        );
                      },
                      child: Text(
                        'Extend Full Screen Sheet',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => SemiFullScreenSheetView(context: mainContext,),
                        );
                      },
                      child: Text(
                        'Semi Full Screen Sheet',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Scrollable Sheet',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}