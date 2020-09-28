

import 'package:flutter/material.dart';

class BottomAppBarFloating extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBar'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

      ),
//      floatingActionButton: FloatingActionButton.extended(
//        elevation: 4.0,
//        icon:  Icon(Icons.add),
//        label: Text('Add a task'),
////        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
////        child: Icon(Icons.add),
//        onPressed: (){
//
//        },
//      ),
      bottomNavigationBar: BottomAppBar(
//        color: Colors.pinkAccent[100],
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
//          mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home),
              SizedBox(width: 20.0,),
              Icon(Icons.search),

            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}