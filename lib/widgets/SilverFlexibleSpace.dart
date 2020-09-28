import 'package:flutter/material.dart';

class SilverFlexibleSpace extends StatefulWidget {
  @override
  _SilverFlexibleSpaceState createState() => _SilverFlexibleSpaceState();
}

class _SilverFlexibleSpaceState extends State<SilverFlexibleSpace> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 150.0,
//            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            flexibleSpace: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 200,
                  child: FlexibleSpaceBar(title: Text("User Status")),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              return ListTile(title: Text("Item ${i}"));
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
