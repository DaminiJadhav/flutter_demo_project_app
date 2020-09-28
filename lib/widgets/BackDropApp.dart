


import
'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/widgets/VisibilityApp.dart';
import 'package:flutterdemoprojectapp/widgets/containerapp.dart';

void main() {
  runApp(BackDropApp());
}

class BackDropApp extends StatefulWidget {
  @override
  _BackDropAppState createState() => _BackDropAppState();
}

class _BackDropAppState extends State<BackDropApp> {
  int position=0;
  final List<Widget> _pages = [containerapp(),VisibilityApp()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BackdropScaffold(
          appBar: BackdropAppBar(
            title: Text('BackDrop'),
            actions: <Widget>[
              BackdropToggleButton(
                icon:AnimatedIcons.list_view  ,
              )
            ],
          ),
          backLayer: BackdropNavigationBackLayer(
            items: <Widget>[
              ListTile(title: Text("Widget 1")),
              ListTile(title: Text("Widget 2")),
            ],
            onTap: (index){
              setState(() {
                position=index;
              });
            },
          ),
          frontLayer: _pages[position],
//          frontLayer:  Center(
//              child:Text("$position"),
//          ),
        ),
//        home: Backdrop,
    );
  }
}
