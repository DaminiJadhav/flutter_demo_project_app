
import 'package:flutter/material.dart';

void main() {
  runApp(myhomepage());
}


class myhomepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Layout Widget',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
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

    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      body: Center(
        child: FittedBox(child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/download.jpg'),
            ),
            Container(
              child: Text('This is widget'),
            )
          ],
        ),fit: BoxFit.contain,),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}