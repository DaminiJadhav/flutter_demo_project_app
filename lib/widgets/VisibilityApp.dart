import 'package:flutter/material.dart';



class VisibilityApp extends StatefulWidget {
  @override
  _VisibilityAppState createState() => _VisibilityAppState();
}

class _VisibilityAppState extends State<VisibilityApp> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visibility'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Show/Hide Card B'),
              onPressed: showToast,
            ),
            Card(
              child: new ListTile(
                title: Center(
                  child: new Text('A'),
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Card(
                child: new ListTile(
                  title: Center(
                    child: new Text('B'),
                  ),
                ),
              ),
//              replacement:Card(
//                child: new ListTile(
//                  title: Center(
//                    child: new Text('B replacement'),
//                  ),
//                ),
//              ),
            ),
            if(_isVisible)  showvisible(),
            if(!_isVisible) Text('Gone'),
            SizedBox(height: 10.0,),
            Opacity(
              opacity: 0.0, //opacity==0.0 means invisible
              child: Text('Welcome'),
            ),
            SizedBox(height: 10.0,),
            Opacity(
              opacity: 1.0, // opacity >=0.0 visible
              child: Text('Hello'),
            ),
            Offstage(
                offstage: true,
                child: Text('Hi')
            ),
            Offstage(
                offstage: false,
                child: Text('Hi !!')
            ),

          ],
        ),
      ),
    );
  }
  Widget showvisible(){
    return Column(
      children: <Widget>[
        Text('Visible'),
        SizedBox(height: 10.0,),
        CircularProgressIndicator(),
      ],
    );
  }
}
