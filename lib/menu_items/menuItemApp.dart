

import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/main.dart';

class menuItemApp extends StatefulWidget {
  @override
  _menuItemAppState createState() => _menuItemAppState();
}

class _menuItemAppState extends State<menuItemApp> {
 String choiceValue="Menu";

  void handleClick(String value){
    setState(() {
      choiceValue=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Items'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: handleClick,
            itemBuilder: (BuildContext context){
              return {'Setting','Logout'}.map((choice) {
                return PopupMenuItem(
                  value: choice,
                  child:Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),

      body:Center(
        child: Text(choiceValue),
      )
    );
  }


}

