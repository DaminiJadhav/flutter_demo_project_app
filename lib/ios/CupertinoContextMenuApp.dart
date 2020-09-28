

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Menu app'),
      ),
      child:  Center(
        child: CupertinoContextMenu(
          actions: <Widget>[
            CupertinoContextMenuAction(
              child: const Text('Action one'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoContextMenuAction(
              child: const Text('Action two'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          child: GestureDetector(
            onTap: () => print('onTap'),
            child:
            Image(image: NetworkImage('https://i.imgur.com/QCNbOAo.png'),width: 60,height: 60,),
          ),
        ),
      ),

    );
    // TODO: implement build
    throw UnimplementedError();
  }

}