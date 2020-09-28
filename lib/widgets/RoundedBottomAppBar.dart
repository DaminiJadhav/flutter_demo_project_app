import 'package:flutter/material.dart';

class RoundedBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Container(
          color: Colors.amber,
        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        floatingActionButton: Transform.translate(
//          offset: Offset(0, -10),
//          child: FloatingActionButton(
//            onPressed: () {},
//            child: Icon(Icons.add),
//            elevation: 2.0,
//          ),
//        ),
        bottomNavigationBar: BottomNavigationView(),
      ),
    );
  }
}

class BottomNavigationView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -10),
      child: Container(

//        margin: EdgeInsets.only(left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)
//          borderRadius: BorderRadius.all(Radius.circular(30),
          ),
          child: BottomAppBar(
//            elevation: 30,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.accessibility_new),
                  ],
                ),
                _buildMiddleTabItem(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.accessibility_new),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24),
            Text(''),
          ],
        ),
      ),
    );
  }
}