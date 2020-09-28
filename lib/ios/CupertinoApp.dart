

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/ios/CupertinoButton.dart';


//void main() {
//  return runApp(CupertinoApp1());
//}

//class CupertinoApp1 extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return CupertinoApp(
//      home: CupertinoStoreHomePage(),
//    );
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//
//}

class CupertinoApp1  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My Flutter IOS App'),
      ),
      child: Container(
        color: Colors.amberAccent,
        child: Center(
          child:
          CupertinoButton.filled(
            child: Text('Ok'),
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                return CupertinoButton1();
              }));
            },
          ),

        ),
      ),
    );
  }
}
