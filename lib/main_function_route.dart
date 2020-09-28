
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/widgets/DynamicLinkApp.dart';

import 'main.dart';

void main(){
  runApp(MaterialApp(
     routes: <String,WidgetBuilder>{
       '/' :(BuildContext context) => DynamicLinkApp(),
       '/helloword' :(BuildContext context) => DynamicLinkApp()
     },
  ));
}