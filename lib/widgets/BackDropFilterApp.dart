
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(BackDropFilterApp());
}

class BackDropFilterApp extends StatefulWidget {
  @override
  _BackDropFilterAppState createState() => _BackDropFilterAppState();
}

class _BackDropFilterAppState extends State<BackDropFilterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Filter'),

        ),
        body:Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/laptop.jpg'),
                      fit: BoxFit.fill,
                )
              ),
              child: BackdropFilter(
                      filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 8.0
                  ),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                ),
              ),
            )

      )
    );
  }
}
