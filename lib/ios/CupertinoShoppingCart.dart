

import 'package:flutter/cupertino.dart';


class CupertinoShoppingCart extends StatefulWidget {
  @override
  _CupertinoShoppingCartState createState() => _CupertinoShoppingCartState();
}

class _CupertinoShoppingCartState extends State<CupertinoShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Shopping cart'),
        )
      ],
    );
  }
}
