




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CupertinoButton.dart';

class CupertinoAlertDialogApp extends StatefulWidget {
  @override
  _CupertinoAlertDialogAppState createState() => _CupertinoAlertDialogAppState();
}

class _CupertinoAlertDialogAppState extends State<CupertinoAlertDialogApp> {
  void displayDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
      new CupertinoAlertDialog(
        title: new Text("Alert"),
        content: new Text("My alert message"),
        actions: [
          CupertinoDialogAction(
             onPressed: (){
                Navigator.of(context).pop();
             },
              isDefaultAction: false,
              child: new Text("Close")),
          CupertinoDialogAction(
              onPressed: (){

                Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                  return CupertinoButton1();
                }));
              },
              isDefaultAction: true,
              child: new Text("ok"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My Flutter IOS App'),
      ),

      child:Center(
//        child: CupertinoActivityIndicator(),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment,
          children: <Widget>[
            CupertinoButton(
              child: Text('show'),
              onPressed: (){
                displayDialog();
//            CupertinoActivityIndicator();
//            Future.delayed(Duration(seconds: 3),() {
//              displayDialog();
//            });
              },
            ),
            CupertinoButton.filled(
              child: Text('show action sheet'),
              onPressed: (){

                showActionSheet();
              },
            ),
          ],
        ),
      ) ,
    );
    // TODO: implement build
    throw UnimplementedError();
  }


  Future<void> showActionSheet() async{
    return await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context){
          return CupertinoActionSheet(
            title: Text('Favorite Dessert'),
            message: Text('Please select the best dessert from the options below.'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Profitriles'),
                onPressed: (){
                },
              ),
              CupertinoActionSheetAction(
                child: Text('Cannolis'),
                onPressed: () { /** */ },
              ),
              CupertinoActionSheetAction(
                child: Text('Trifie'),
                onPressed: () { /** */ },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          );

        });
  }

}
