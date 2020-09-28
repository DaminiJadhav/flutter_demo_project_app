import 'package:flutter/material.dart';

class FacebookAppbarDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/facebook.png',
                    fit: BoxFit.cover,
                    height: 35.0,
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                    print('Click Search');
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Image.asset('assets/google.png'),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                    print('Click Message');
                  },
                ),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.grey),
            )));
  }
}