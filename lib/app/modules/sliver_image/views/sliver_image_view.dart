import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sliver_image_controller.dart';

class SliverImageView extends GetView<SliverImageController> {
  final List<String> list = [
    'amine',
    'amine2',
    'amine3',
    'amine4',
    'amine5',
    'amine6',
    'amine7',
    'amine8',
    'amine9',
  ];

  final colorbg=Color(0xFF01002E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        color: colorbg,
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              //to delete back button that appear if you push new page not pushreplaced
                              automaticallyImplyLeading: false,
                              //heignt size
                              expandedHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 100,
                              // if false you want to go to the up then see flexiblespace
                              floating: false,
                              //if true will not hide flexible space
                              pinned: false,
                              // Display a placeholder widget to visualize the shrinking size.
                              flexibleSpace: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.deepOrangeAccent,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: CachedNetworkImage(
                                        imageUrl: 'https://i.imgur.com/StNtgvB.jpg',
                                        placeholder: (context, url) => Container(
                                          color: Colors.black,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                                              colorbg,
                                              colorbg.withOpacity(0.8),
                                              colorbg.withOpacity(0),
                                            ]),
                                          ),
                                        )),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      alignment: Alignment(0.0, 0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'FireWatch Play Now',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 30, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Make the initial height of the SliverAppBar larger than normal.
                            ),
                            /* SliverPersistentHeader(
                  delegate: _SliverPersistentHeaderDelegate(
                      child: PreferredSize(
                    preferredSize: Size.fromHeight(200.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.lightGreen,
                      child: Center(
                        child: Text(
                          'SliverPersistentHeader delegate => _SliverPersistentHeaderDelegate(class) child => PreferredSize ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )),
                ),*/
                            SliverList(
                              // Use a delegate to build items as they're scrolled on screen.
                              delegate: SliverChildBuilderDelegate(
                                // The builder function returns a ListTile with a title that
                                // displays the index of the current item.
                                    (context, index) {
                                  return Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.all(16),
                                    height: 50,
                                    child: Card(
                                      elevation: 4,
                                      shadowColor: Colors.black38,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                  );
                                },
                                // Builds 1000 ListTiles
                                childCount: 1000,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }
}
