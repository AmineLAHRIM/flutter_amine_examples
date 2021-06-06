import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sliver_controller.dart';

class SliverView extends GetView<SliverController> {
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
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(
              'Fixed Container Here',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  //to delete back button that appear if you push new page not pushreplaced
                  automaticallyImplyLeading: false,
                  //heignt size
                  expandedHeight: 150,
                  // if false you want to go to the up then see flexiblespace
                  floating: true,
                  //if true will not hide flexible space
                  pinned: false,
                  // Display a placeholder widget to visualize the shrinking size.
                  flexibleSpace: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.deepOrangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Amine CustomScrollView > SilverAppBar + SliverList',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Make the initial height of the SliverAppBar larger than normal.
                ),
                SliverPersistentHeader(
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
                ),
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

class Example1 extends StatelessWidget {
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
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(
              'Fixed Container Here',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  //to delete back button that appear if you push new page not pushreplaced
                  automaticallyImplyLeading: false,
                  //heignt size
                  expandedHeight: 150,
                  // if false you want to go to the up then see flexiblespace
                  floating: true,
                  //if true will not hide flexible space
                  pinned: false,
                  // Display a placeholder widget to visualize the shrinking size.
                  flexibleSpace: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.deepOrangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Amine CustomScrollView > SilverAppBar + SliverList',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Make the initial height of the SliverAppBar larger than normal.
                ),
                SliverPersistentHeader(
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
                ),
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

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
