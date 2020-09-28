

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(BackDropFilterApp_Stack());
}

class BackDropFilterApp_Stack extends StatelessWidget {

  double _sigmaX = 5.0; // from 0-10
  double _sigmaY = 0.0; // from 0-10
  double _opacity = 0.1; // from 0-1.0
  double _width = 350;
  double _height = 300;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Filter using multiple widget'),

        ),
        body: Stack(
            children: <Widget>[
              Image.asset(
                'assets/laptop.jpg',
                width: _width,
                height: _height,
                fit: BoxFit.cover,
              ),
          FlutterLogo(size: 80, colors: Colors.red),
          Container(
            width: 200,
            height: _height,
            child:ClipRect (

            child : BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Container(
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
          )
          )
            ],
        ),
      ),
    );
  }
}

