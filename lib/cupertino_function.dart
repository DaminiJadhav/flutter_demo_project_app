


import 'package:flutter/cupertino.dart';

import 'ios/Android&Cupertino.dart';
import 'ios/CupertinoAlertDialogApp.dart';
import 'ios/CupertinoApp.dart';
import 'ios/CupertinoBottomNavigationBar.dart';
import 'ios/CupertinoButton.dart';
import 'ios/CupertinoContextMenuApp.dart';

void  main(){
//  runApp(AndroidCupertino());
  runApp(CupertinoApp(
    home: CupertinoContextMenuApp(),
  ));
}