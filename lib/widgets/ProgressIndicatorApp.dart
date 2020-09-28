


import 'package:flutter/material.dart';

class ProgressIndicatorApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Progess bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          CircularProgressIndicator(
            strokeWidth: 5,
          ),
          Divider(
            height: 10.0,
          ),
          CircularProgressIndicator(
                value: 0.4,
              ),
          Divider(
            height: 10.0,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Divider(
            height: 10.0,
          ),
          CircularProgressIndicator(
            strokeWidth: 6.0,
          ),

        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}