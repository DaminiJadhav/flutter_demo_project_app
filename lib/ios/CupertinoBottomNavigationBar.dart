



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/ios/CupertinoProductListTab.dart';

import 'CupertinoSearchTab.dart';

//class CupertinoBottomNavigationBar extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return CupertinoApp(
//      home: CupertinoHomeBottomNavigationBar(),
//    );
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//
//}


class CupertinoHomeBottomNavigationBar extends StatelessWidget {
//  var returnvalue;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('search')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('shopping')
          ),
        ],
      ),
      tabBuilder:(context,index){
        CupertinoTabView returnvalue;
        switch(index){
          case 0:
            returnvalue=CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                child: CupertinoProductListTab(),
              );
            });
            break;
          case 1:
            returnvalue=CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                child: CupertinoSearchTab(),
              );
            });
            break;
          case 2:
            returnvalue=CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(
                child: Container(
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text('damini'),
                  ),
                ),
              );
            });
            break;
        }
        return returnvalue;
      },
    );
  }
}
