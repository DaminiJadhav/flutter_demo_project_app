import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'CupertinoApp.dart';




class AndroidCupertino extends StatefulWidget {
  @override
  _AndroidCupertinoState createState() => _AndroidCupertinoState();
}

class _AndroidCupertinoState extends State<AndroidCupertino> {

  final materialtheme=ThemeData(
    accentColor: Colors.blue,
    primarySwatch: Colors.blue,
//    scaffoldBackgroundColor: Colors.orange,
//    textTheme: TextTheme().copyWith(body1: TextTheme().body1)
  );
  final cupertinotheme=CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor:Colors.white
  );
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      android: (_) => MaterialAppData(theme: materialtheme),
      ios: (_) => CupertinoAppData(theme: cupertinotheme),
      home: AndroidCupertinoAppState(),
    );

  }
}


class AndroidCupertinoAppState extends StatefulWidget {
  @override
  _AndroidCupertinoAppStateState createState() => _AndroidCupertinoAppStateState();
}

class _AndroidCupertinoAppStateState extends State<AndroidCupertinoAppState> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        material: (_, __) => MaterialScaffoldData(
          appBar: AppBar(
            title: Text('Android'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            tooltip: 'Android page',
            child: Icon(Icons.add),
          )
        ),
      cupertino: (_,__) => CupertinoPageScaffoldData(
        navigationBar:CupertinoNavigationBar(
          middle: Text('IOS'),
          trailing: PlatformButton(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                platformPageRoute(builder: (BuildContext context) {
                  return CupertinoApp1();
                }, context: context),
              );
            },
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformTextField(
          keyboardType: TextInputType.text,
          material: (_,__)=> MaterialTextFieldData(
            decoration: InputDecoration(labelText: 'Full Name')
          ),
          cupertino: (_,__) => CupertinoTextFieldData(
            placeholder: 'Full name',

          ),
        ),
      ),
    );
  }
}


//child:  Container(
//child: Center(
//child: Column(
//mainAxisSize:  MainAxisSize.min,
//children: <Widget>[
//Text('dhgdd'),
//CupertinoTextField(
//placeholder: 'Text Field',
//),
//],
//),
//),
//),
