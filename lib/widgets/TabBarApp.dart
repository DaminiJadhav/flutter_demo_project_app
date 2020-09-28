


import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/menu_items/menuItemApp.dart';
import 'package:flutterdemoprojectapp/menu_items/menuItemApp_Icon.dart';
import 'package:flutterdemoprojectapp/widgets/ProductList.dart';

class TabBarApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar App'),
          bottom: TabBar(
//            labelColor: Colors.red,
//            indicatorColor: Colors.green,

            tabs: <Widget>[

              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.date_range),),
              Tab(icon: Icon(Icons.search),)

            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
//            ProductList(),
//            menuItemApp(),
//            menuItemApp_Icon()
            Icon(Icons.home),
            Icon(Icons.date_range),
            Icon(Icons.search),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}