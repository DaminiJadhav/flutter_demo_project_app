import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/util/SessionManage.dart';

class GetSharedPreferenceDataString extends StatefulWidget {
  @override
  _GetSharedPreferenceDataStringState createState() => _GetSharedPreferenceDataStringState();
}

class _GetSharedPreferenceDataStringState extends State<GetSharedPreferenceDataString> {


  SessionManage prefs=SessionManage();
  List<String> _list=['apple','banana','pineapple','orange'];
  @override
  void initState() {
    prefs.setAuthToken("abc13");
    prefs.setdata("abc134567890");
    prefs.setSomeStringData("9876543187");
    prefs.setListdata(_list);
    print("Fruitlist ${_list}");
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: RaisedButton(
                child: Text('Set String'),
                onPressed:(){
                  prefs.setStringValue("Welcome to flutter project");

                },
              ),
          ),
          RaisedButton(
            child: Text('get String'),
            onPressed:(){
              Future<String> str2= prefs.getdata();
              str2.then((value) {
                print(" data "+ value.toString());
              },onError: (e){
                print(e);
              });
              Future<String> str1= prefs.getstringdata();
              str1.then((value) {
                print("get data "+ value.toString());
              },onError: (e){
                print(e);
              });
              Future<String> authToken = prefs.getAuthToken();
              authToken.then((data) {
                print("authToken " + data.toString());
              },onError: (e) {
                print(e);
              });
              Future<String> phone= prefs.getSomeStringData();
              phone.then((phoneno) {
                print(" phone number "+ phoneno.toString());
              },onError: (e){
                print(e);
              });
              Future<List<String>> listdatavalue= prefs.getListdata();
              listdatavalue.then((list) {
                print("Fruits "+ list.toString());
              },onError: (e){
                print(e);
              });
            },
          ),
        ],
      ),
    );
  }
}
