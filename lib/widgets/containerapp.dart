

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(containerapp());
}
class containerapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Layout Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(color: Colors.blue,),
            Container(color: Colors.pink,
            height: 400.0,
            width: 300.0,),
            Container(color: Colors.yellow,
              height: 220.0,
              width: 200.0,)
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}