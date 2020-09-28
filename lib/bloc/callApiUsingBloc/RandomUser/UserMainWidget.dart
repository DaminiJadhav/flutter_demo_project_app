import 'package:flutter/material.dart';

import 'UserWidget.dart';

class UserMainWidget extends StatefulWidget {
  @override
  _UserMainWidgetState createState() => _UserMainWidgetState();
}

class _UserMainWidgetState extends State<UserMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api call using bloc'),
      ),
      body: Container(
        child: UserWidget(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.7],
            colors: [
              Color(0xFFF12711),
              Color(0xFFf5af19),
            ],
          ),
        ),
      ),
    );
  }
}
