



import 'package:flutter/cupertino.dart';

class CupertinoSearchTab extends StatefulWidget{
  @override
  _CupertinoSearchTabState createState() => _CupertinoSearchTabState();
}

class _CupertinoSearchTabState extends State<CupertinoSearchTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
            largeTitle: Text('Search'),
        )
      ],
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
