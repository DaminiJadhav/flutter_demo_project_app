

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class CupertinoButton1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Button'),
      ),
      child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              child: Text('Button 1'),
              onPressed: () { /** */ },
            ),
            CupertinoButton.filled(
              child: Text('Button 2'),
              onPressed: () { /** */ },
            ),
          ],
        ),
      )
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget _customButton() {
    return Platform.isIOS
        ? CupertinoButton(
              child: Text('IOS'),
              onPressed: () {},
    )
        : RaisedButton(
              child: Text('Android'),
              onPressed: () {},
    );
  }

}