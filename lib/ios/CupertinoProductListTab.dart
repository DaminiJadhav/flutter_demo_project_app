

import 'package:flutter/cupertino.dart';

class CupertinoProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Home'),
        )
      ],
    );
//    return Consumer<AppStateModel>(
//      builder: (context, model, child) {
//        return const CustomScrollView(
//          slivers: <Widget>[
//            CupertinoSliverNavigationBar(
//              largeTitle: Text('Shopping Cart'),
//            ),
//          ],
//        );
//      },
//    );
  }
}
