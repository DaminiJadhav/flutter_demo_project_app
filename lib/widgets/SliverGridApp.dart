

import 'package:flutter/material.dart';

class SliverGridApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SilverAppBar gridview'),
            actions: <Widget>[
              Icon(Icons.timer)
            ],
            leading: Icon(Icons.menu),
//            backgroundColor: Colors.amberAccent,
            bottom: PreferredSize(
              child: Icon(Icons.ac_unit,size: 30.0,),
              preferredSize: Size.fromHeight(50.0),
            ),
            brightness: Brightness.dark,
//            expandedHeight: 40.0
            floating: true,
            pinned: false,
            snap: true,
//            primary: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
//              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
//                    color: Colors.pink[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Image.asset("assets/tab.jpg",width: 50.0,height: 50.0,),
                      Text('Tab')
                    ],
                    ),
//                  color: Colors.teal[100 * (index % 9)],
//                    child: Text('grid item $index'),
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}