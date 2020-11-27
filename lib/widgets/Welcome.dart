import 'package:flutter/material.dart';

class WelcomWidget extends StatefulWidget {
  @override
  _WelcomWidgetState createState() => _WelcomWidgetState();
}

class _WelcomWidgetState extends State<WelcomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Text('Welcome'),
      ),
    );
  }
}
