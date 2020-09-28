


import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:uni_links/uni_links.dart';

class PageUrlLinkApp extends StatefulWidget{
  @override
  _PageUrlLinkAppState createState() => _PageUrlLinkAppState();
}

enum UniLinksType{
  String, url
}

class _PageUrlLinkAppState extends State<PageUrlLinkApp> with SingleTickerProviderStateMixin{
//  String _latestlink='Unknow';
//  Uri _latestUri;
//
//   StreamSubscription _sub;
//   TabController _tabController;
//   UniLinksType _type=UniLinksType.String;
//
////  final List<String> _cmds = getCmds();
//  final TextStyle _cmdStyle = const TextStyle(
//      fontFamily: 'Courier', fontSize: 12.0, fontWeight: FontWeight.w700);
//  final _scaffoldkey=new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _tabController = new TabController(vsync: this, length: 2);
//    _tabController.addListener(_handleTabChange);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

//  _handleTabChange(){
//    if(_tabController.indexIsChanging){
//      setState(() {
//        _type=UniLinksType.values[_tabController.index];
//      });
//
//    }
//  }
//  List<String> getCmds(){
//    String cmd;
//    String cmdSuffix = '';
//
//    if(Platform.isIOS){
//      cmd= '/usr/bin/xcrun simctl openurl booted';
//    }else if(Platform.isAndroid){
//      cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
//          ' -a android.intent.action.VIEW'
//          ' -c android.intent.category.BROWSABLE -d';
//      cmdSuffix = "'";
//    }else{
//      return null;
//    }
//    return [
//      '$cmd "unilinks://host/path/subpath"$cmdSuffix',
//      '$cmd "unilinks://example.com/path/portion/?uid=123&token=abc"$cmdSuffix',
//      '$cmd "unilinks://example.com/?arr%5b%5d=123&arr%5b%5d=abc'
//          '&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82"$cmdSuffix',
//    ];
//  }
}