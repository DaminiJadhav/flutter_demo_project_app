

import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimerAp extends StatefulWidget {
  @override
  _CountDownTimerApState createState() => _CountDownTimerApState();
}

class _CountDownTimerApState extends State<CountDownTimerAp> {

  Timer _timer;
  int _start=10;


  void StartTimer(){
    const onesec=const Duration(seconds: 1);
    _timer=new Timer.periodic(
        onesec,
            (timer) {
          setState(() {
            if(_start<1){
              timer.cancel();
            }else{
              _start=_start-1;
            }
          });
        });

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer test")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              StartTimer();
            },
            child: Text("start"),
          ),
          Text('$_start')
        ],
      ),
    );
  }
}
