
import 'package:flutter/material.dart';
import 'file:///D:/FlutterProjects/NewProject/flutter_demo_project_app/lib/util/SessionManage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp extends StatefulWidget {
  @override
  _SharedPreferencesAppState createState() => _SharedPreferencesAppState();
}

class _SharedPreferencesAppState extends State<SharedPreferencesApp> {
  var read;
  bool _isVisible = true;
  SessionManage sessionManage=new SessionManage();

  void showiamge() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Read'),
              onPressed: () {
                _read();
                showiamge();

//            _increamentCounter();
              }
          ),
          RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              }
          ),
          if(read!=null) Visiblecontent(),
          if(read==null) Text('Welcome'),

        ],
      ),
    );
  }

    _read() async{
      final pref=await SharedPreferences.getInstance();
      read=pref.getString('my_value') ?? 0;
      print('Read $read');

    }

    _save() async{
        final pref=await SharedPreferences.getInstance();
        final key="my_value";
        final value='assets/desktop.jpg';
        pref.setString(key, value);
        print('Saved $value');
    }

    Widget Visiblecontent(){
       return Container(
         child: Image.asset(read),
       );
    }
}




