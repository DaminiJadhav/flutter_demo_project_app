
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'DateTimePickerApp.dart';


class ProgressIndicatorTimerApp extends StatefulWidget {

  @override
  _ProgressIndicatorTimerAppState createState() => _ProgressIndicatorTimerAppState();
}

class _ProgressIndicatorTimerAppState extends State<ProgressIndicatorTimerApp> {
  double _progress=0;
  ProgressDialog progressDialog;
  bool visible=false;




  void startTimer(){
    new Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) {
                setState(() {
                  if(_progress==1){
//                    visible=false;
                    timer.cancel();
                  }else{
                    _progress+=0.2;
                  }
                });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    progressDialog=new ProgressDialog(context);
    progressDialog.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        insetAnimCurve: Curves.ease,
        progress: 0.0,

        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress indicator timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(

          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('start'),
                onPressed:(){
                  visible=!visible;
                    startTimer();
                },
              ),
              if(visible) CircularProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              RaisedButton(
                child: Text('Show Dialog'),
                onPressed:(){
                  progressDialog.show();
                  Future.delayed(Duration(seconds: 3)).then((value) {
                    progressDialog.hide().whenComplete(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => DateTimePickerApp()));
                    });
                  });
                },
              ),
              SizedBox(height: 10.0,),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                value: 0.4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              )
            ],
          ),  
        ),
      ),
    );
  }
}
