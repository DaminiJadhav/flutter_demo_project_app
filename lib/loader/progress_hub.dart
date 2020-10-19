import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/loader/progress_hub_button.dart';

class ProgressHubExample extends StatefulWidget {
  @override
  _ProgressHubExampleState createState() => _ProgressHubExampleState();
}

class _ProgressHubExampleState extends State<ProgressHubExample> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Loader......."),
      ),
      body: ProgressHubButtonExample()
    );
  }
}
