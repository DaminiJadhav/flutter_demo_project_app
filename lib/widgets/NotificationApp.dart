

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NoticationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeNotificationApp(),
    );
  }
}

class HomeNotificationApp extends StatefulWidget {
  @override
  _HomeNotificationAppState createState() => _HomeNotificationAppState();
}

class _HomeNotificationAppState extends State<HomeNotificationApp> {

  FlutterLocalNotificationsPlugin  flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializing();
  }

  void initializing() async{
    androidInitializationSettings=AndroidInitializationSettings('lock');
    iosInitializationSettings =IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings=InitializationSettings(androidInitializationSettings,iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);
  }


  void show_notification() async{
    await notification();
  }

  Future<void> notification() async{
    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        'channel_id',
        'channel_title',
        'channel body',
         priority: Priority.High,
         importance:Importance.Max,
         ticker: 'test'
    );

    IOSNotificationDetails iosNotificationDetails=IOSNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(androidNotificationDetails,iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Hi !!!', 'This is my first flutter notification', notificationDetails);
  }

  Future onSelectNotification(String payload){
    if(payload!=null){
      print(payload);
    }
  }

  Future onDidReceiveLocalNotification(int id,String title,String body,String paayload) async{
   return CupertinoAlertDialog(
     title: Text(title),
     content: Text(body),
     actions: <Widget>[
       CupertinoDialogAction(
         isDefaultAction: true,
         child: Text('Ok'),
         onPressed: (){
           print("");
         },
       )
     ],
   );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Show Notification'),
            onPressed: (){
                      show_notification();

            },
          )
        ],
      ),
    );
  }
}

